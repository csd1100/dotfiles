return {
  -- Package Manager
  {
    'mason-org/mason.nvim',
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
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = 'select',
          }),
          ['<Down>'] = cmp.mapping.select_next_item({
            behavior = 'select',
          }),
          ['<Right>'] = cmp.mapping.confirm({ select = true }),
          ['<Left>'] = cmp.mapping.abort(),
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
  -- formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt' },
        rust = { 'rustfmt' },
        javascript = { 'prettier' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        markdown = { 'prettier' },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = 'fallback',
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500 },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
      },
    },
    init = function()
      vim.api.nvim_create_user_command('Format', function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line =
            vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            ['start'] = { args.line1, 0 },
            ['end'] = { args.line2, end_line:len() },
          }
        end
        require('conform').format({
          lsp_format = 'fallback',
          range = range,
        })
      end, { range = true })
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'csd1100/modes.nvim',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'stevearc/conform.nvim',
    },
    config = function()
      -- formatter
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
          ['gt'] = {
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
          ['<C-e>n'] = {
            ['rhs'] = vim.lsp.buf.rename,
            ['opts'] = { desc = 'Rename' },
          },
          ['<A-S-f>f'] = {
            ['rhs'] = '<cmd>Format<CR>',
            ['opts'] = { desc = 'Format' },
          },
          ['<C-q>'] = {
            ['rhs'] = vim.lsp.buf.code_action,
            ['opts'] = { desc = 'Code Actions' },
          },
          ['t]'] = {
            ['rhs'] = function()
              vim.diagnostic.jump({ count = 1, float = true })
            end,
            ['opts'] = { desc = 'Go to Next Diagnostic Message' },
          },
          ['t['] = {
            ['rhs'] = function()
              vim.diagnostic.jump({ count = -1, float = true })
            end,
            ['opts'] = { desc = 'Go to Previous Diagnostic Message' },
          },
          ['Q'] = {
            ['rhs'] = function()
              vim.diagnostic.open_float()
            end,
            ['opts'] = { desc = 'Show Diagnostic Message' },
          },
        },
        ['x'] = {
          ['<A-S-f>l'] = {
            ['rhs'] = vim.lsp.buf.format,
            ['opts'] = { desc = 'Format Selection' },
          },
        },
      }
      modes.add_maps('LSP', maps)

      local cmp_lsp = require('cmp_nvim_lsp')
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          modes.enable_mode('LSP', { buffer = ev.buf })
        end,
      })

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
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
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'taplo' },
        automatic_enable = {
          exclude = {
            'lua_ls',
          },
        },
      })

      vim.diagnostic.config({
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
