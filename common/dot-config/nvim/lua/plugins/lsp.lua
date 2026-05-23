return {
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    commit = 'a1d504892f2bc56c2e79b65c6faded2fd21f3eca',
    event = 'VeryLazy',
    dependencies = {
      {
        'hrsh7th/cmp-buffer',
        commit = 'b74fab3656eea9de20a9b8116afa3cfc4ec09657'
      },
      {
        'hrsh7th/cmp-path',
        commit = 'c642487086dbd9a93160e1679a1327be111cbc25'
      },
      {
        'hrsh7th/cmp-cmdline',
        commit = 'd126061b624e0af6c3a556428712dd4d4194ec6d'
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        commit = 'cbc7b02bb99fae35cb42f514762b89b5126651ef'
      },
      {
        'hrsh7th/cmp-nvim-lua',
        commit = 'e3a22cb071eb9d6508a156306b102c45cd2d573d'
      },
      {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        commit = 'fd3e882e56956675c620898bf1ffcf4fcbe7ec84'
      },
      {
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        commit = 'hrsh7th/cmp-nvim-lsp-document-symbol'
      },
      {
        'L3MON4D3/LuaSnip',
        commit = '0abc8f390b278c3b4aabc4c004ac8a088b65cf24'
      },
    },
    config = function()
      local cmp = require('cmp')

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp_signature_help' },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = 'select',
          }),
          ['<Down>'] = cmp.mapping.select_next_item({
            behavior = 'select',
          }),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
      })

      require('cmp').setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          -- NOTE: triggers on '/@'
          { name = 'nvim_lsp_document_symbol' },
        }, {
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        }),
      })
    end,
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'csd1100/modes.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local modes = require('modes')
      modes.create_if_not_present('LSP', function() end, function() end, '{}')
      modes.add_maps('LSP', require('config.lsp-keymaps'))

      local cmp_lsp = require('cmp_nvim_lsp')
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.name ~= 'rust-analyzer' then
            modes.enable_mode('LSP', { buffer = ev.buf })
          end
        end,
      })

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be STRING!!
              defaultConfig = {
                indent_style = 'space',
                indent_size = '2',
              },
            },
          },
        },
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = 'H',
          },
        },
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
      })
    end,
  },
}
