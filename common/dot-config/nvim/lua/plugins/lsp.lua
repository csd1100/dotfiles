return {
  -- Package Manager
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {
      ui = {
        border = ui_borders,
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        -- NOTE: there are couple of things that do not work on nvim v0.11
        -- ui.float_border, format_mapping does not work on v0.11
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
      },
      { 'csd1100/modes.nvim' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local modes = require('modes')
      modes.create_if_not_present('LSP', function() end, function() end, '{}')
      local maps = {
        ['n'] = {
          ['K'] = {
            ['rhs'] = function()
              vim.lsp.buf.hover({ border = ui_borders })
            end,
            ['opts'] = { desc = 'Hover Info' },
          },
          ['gd'] = {
            ['rhs'] = vim.lsp.buf.definition,
            ['opts'] = { desc = 'Go To Definition' },
          },
          ['gD'] = {
            ['rhs'] = vim.lsp.buf.declaration,
            ['opts'] = { desc = 'Go To Declaration' },
          },
          ['gi'] = {
            ['rhs'] = vim.lsp.buf.implementation,
            ['opts'] = { desc = 'Go To Implementation' },
          },
          ['go'] = {
            ['rhs'] = vim.lsp.buf.type_definition,
            ['opts'] = { desc = 'Go To Type Definition' },
          },
          ['gr'] = {
            ['rhs'] = vim.lsp.buf.references,
            ['opts'] = { desc = 'Go To References' },
          },
          ['gs'] = {
            ['rhs'] = function()
              vim.lsp.buf.signature_help({ border = ui_borders })
            end,
            ['opts'] = { desc = 'Go To Signature Help' },
          },
          ['grn'] = {
            ['rhs'] = vim.lsp.buf.rename,
            ['opts'] = { desc = 'Rename' },
          },
          -- TODO: use https://lsp-zero.netlify.app/docs/reference/lua-api.html#format-mapping-key-opts
          -- if necessary
          ['<leader>lf'] = {
            ['rhs'] = function()
              vim.lsp.buf.format({ async = true })
            end,
            ['opts'] = { desc = 'Format' },
          },
          ['<leader>lca'] = {
            ['rhs'] = vim.lsp.buf.code_action,
            ['opts'] = { desc = 'Code Actions' },
          },
        },
        ['x'] = {
          -- TODO: use https://lsp-zero.netlify.app/docs/reference/lua-api.html#format-mapping-key-opts
          -- if necessary
          ['<leader>lf'] = {
            ['rhs'] = function()
              vim.lsp.buf.format({ async = true })
            end,
            ['opts'] = { desc = 'Format Selection' },
          },
        },
      }
      modes.add_maps('LSP', maps)

      local lsp_attach = function(client, bufnr)
        modes.enable_mode('LSP', { buffer = bufnr })
        lsp_zero.highlight_symbol(client, bufnr)
      end

      lsp_zero.extend_lspconfig({
        lsp_attach = lsp_attach,
        sign_text = {
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = 'i',
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          lua_ls = lsp_zero.noop,
        },
      })

      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'onsails/lspkind.nvim' },
    },
    config = function()
      local cmp = require('cmp')
      local lsp_zero = require('lsp-zero')

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
        formatting = {
          format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          }),
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
          ['<C-f>'] = lsp_zero.cmp_action().luasnip_jump_forward(),
          ['<C-b>'] = lsp_zero.cmp_action().luasnip_jump_backward(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = 'select',
          }),
          ['<Down>'] = cmp.mapping.select_next_item({
            behavior = 'select',
          }),
          ['<Tab>'] = cmp.mapping.select_next_item({
            behavior = 'select',
          }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({
            behavior = 'select',
          }),
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
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require('null-ls')

      null_ls.setup({
        sources = {
          null_ls.builtins.completion.spell,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
  },
}
