local ku = require('config.keymap-utils')

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'echasnovski/mini.icons',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      defaults = {
        path_display = {
          shorten = { len = 2, exclude = { -1, 1 } },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '--ignore',
            '--hidden',
            '--no-ignore-vcs',
            '-g',
            '!{.git,node_modules,target,out,build}',
          },
        },
        buffers = {
          ignore_current_buffer = true,
          sort_mru = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
      },
    },
    config = function(_, opts)
      local lga_actions = require('telescope-live-grep-args.actions')

      if vim.g.colors_name == 'monokai-pro' then
        opts.defaults.borderchars =
          { '█', ' ', '▀', '█', '█', ' ', ' ', '▀' }
      end

      opts.extensions.live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ['<C-k>'] = lga_actions.quote_prompt(),
            ['<C-i>'] = lga_actions.quote_prompt({
              postfix = ' --iglob ',
            }),
          },
        },
      }

      local telescope = require('telescope')
      telescope.setup(opts)

      local builtin = require('telescope.builtin')
      ku.map(
        'n',
        '<leader><leader>',
        builtin.find_files,
        { desc = 'Telescope find files' }
      )
      ku.map(
        'n',
        '<leader>ff',
        telescope.extensions.live_grep_args.live_grep_args,
        { desc = 'Telescope live grep' }
      )
      ku.map('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume' })
      ku.map('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
      ku.map(
        'n',
        '<leader>h',
        builtin.help_tags,
        { desc = 'Telescope help tags' }
      )
      ku.map(
        'n',
        'go',
        builtin.treesitter,
        { desc = 'Telescope treesitter symbols' }
      )
      ku.map(
        'n',
        '<leader>cs',
        builtin.colorscheme,
        { desc = 'Telescope colorschemes' }
      )
      ku.map(
        'n',
        '<leader>n',
        telescope.extensions.notify.notify,
        { desc = 'Telescope Notifications' }
      )

      telescope.load_extension('fzf')
      telescope.load_extension('live_grep_args')
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'csd1100/modes.nvim',
    },
    event = 'BufEnter',
    opts = function()
      local modes = require('modes')

      local function get_custom_global_modes()
        return table.concat(modes.get_active_modes_icons('*'), '│')
      end

      local function get_custom_buffer_modes()
        return table.concat(
          modes.get_active_modes_icons(vim.api.nvim_get_current_buf()),
          '│'
        )
      end

      return {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'diagnostics' },
          lualine_x = { 'searchcount', 'selectioncount', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              tab_max_length = 15,
              mode = 1,
              path = 1,
              max_length = vim.o.columns,
            },
          },
          lualine_y = {
            {
              get_custom_buffer_modes,
            },
          },
          lualine_z = {
            {
              get_custom_global_modes,
            },
          },
        },
      }
    end,
  },
  {
    url = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
    event = 'VeryLazy',
    init = function()
      local rainbow_delimiters = require('rainbow-delimiters')

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = highlight,
      }
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = {
      indent = {},
      scope = {},
      exclude = { filetypes = { 'dashboard' } },
    },
    config = function(_, opts)
      local hooks = require('ibl.hooks')
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)
      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )

      opts.indent.highlight = highlight
      opts.scope.highlight = highlight

      require('ibl').setup(opts)
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {
      theme = 'doom',
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = {
          [[]],
          [[]],
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
          [[]],
          [[]],
          [[]],
        },
        center = {
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Load Last Session of CWD ',
            desc_hl = 'String',
            key = 'l',
            key_hl = 'Number',
            action = "lua require('persistence').load()",
          },
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Open Recently Opened File',
            desc_hl = 'String',
            key = 'h',
            key_hl = 'Number',
            action = 'Telescope oldfiles',
          },
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Open a New File          ',
            desc_hl = 'String',
            key = 'n',
            key_hl = 'Number',
            action = 'enew',
          },
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Open Explorer            ',
            desc_hl = 'String',
            key = 'e',
            key_hl = 'Number',
            action = 'Ex',
          },
        },
        footer = {},
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    init = function()
      vim.notify = require('notify')
    end,
    opts = {
      timeout = 300,
    },
    config = true,
  },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    config = true,
    keys = {
      {
        '<leader>tD',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>td',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>ts',
        '<cmd>Trouble symbols toggle focus=true<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>tr',
        '<cmd>Trouble lsp toggle focus=true win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>tl',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>tq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    dependencies = {
      'csd1100/modes.nvim',
    },
    opts = {
      numhl = true,
      signs_staged = {
        add = { text = ' ' },
        change = { text = ' ' },
        delete = { text = ' ' },
        untracked = { text = '┆' },
      },
      signs = {
        add = { text = ' ' },
        change = { text = ' ' },
        delete = { text = ' ' },
        untracked = { text = '┆' },
      },
    },
    init = function()
      ku.map(
        { 'n', 'v' },
        '<leader>v[',
        ":lua require('gitsigns').prev_hunk()<CR>",
        { desc = 'Previous Hunk (GIT)' }
      )
      ku.map(
        { 'n', 'v' },
        '<leader>v]',
        ":lua require('gitsigns').next_hunk()<CR>",
        { desc = 'Next Hunk (GIT)' }
      )
      -- -- git splkey: v --
      local gitModeMaps = {
        ['n'] = {
          ['<leader>vs'] = {
            ['rhs'] = function()
              require('gitsigns').stage_hunk()
            end,
            ['opts'] = { desc = 'Stage Hunk' },
          },
          ['<leader>vu'] = {
            ['rhs'] = function()
              require('gitsigns').undo_stage_hunk()
            end,
            ['opts'] = { desc = 'Undo Stage Hunk' },
          },
          ['<leader>vr'] = {
            ['rhs'] = function()
              require('gitsigns').reset_hunk()
            end,
            ['opts'] = { desc = 'Reset Hunk' },
          },
          ['<leader>vp'] = {
            ['rhs'] = function()
              require('gitsigns').preview_hunk()
            end,
            ['opts'] = { desc = 'Preview Hunk' },
          },
          ['<leader>vbf'] = {
            ['rhs'] = function()
              require('gitsigns').blame_line({
                full = true,
              })
            end,
            ['opts'] = { desc = 'Blame File' },
          },
          ['<leader>vbc'] = {
            ['rhs'] = function()
              require('gitsigns').toggle_current_line_blame()
            end,
            ['opts'] = { desc = 'Toggle Blame Current Line' },
          },
          ['<leader>vd'] = {
            ['rhs'] = function()
              require('gitsigns').diffthis()
            end,
            ['opts'] = { desc = 'Diff' },
          },
          ['<leader>vtd'] = {
            ['rhs'] = function()
              require('gitsigns').toggle_deleted()
            end,
            ['opts'] = { desc = 'Show Deleted Lines' },
          },
          ['<leader>vS'] = {
            ['rhs'] = function()
              require('gitsigns').stage_hunk()
            end,
            ['opts'] = { desc = 'Stage Buffer' },
          },
          ['<leader>vR'] = {
            ['rhs'] = function()
              require('gitsigns').reset_buffer()
            end,
            ['opts'] = { desc = 'Reset Buffer' },
          },
        },
        ['v'] = {
          ['<leader>vs'] = {
            ['rhs'] = function()
              require('gitsigns').stage_hunk()
            end,
            ['opts'] = { desc = 'Stage Hunk' },
          },
          ['<leader>vr'] = {
            ['rhs'] = function()
              require('gitsigns').reset_hunk()
            end,
            ['opts'] = { desc = 'Reset Hunk' },
          },
        },
      }
      local modes = require('modes')
      modes.create_if_not_present(
        'GIT',
        function() end,
        function() end,
        '  '
      )
      modes.add_maps('GIT', gitModeMaps)
      ku.map(
        'n',
        '<leader>vg',
        ":lua require('modes').toggle_mode('GIT')<CR>",
        { desc = 'Toggle GIT Mode' }
      )
      ku.map(
        'n',
        '<leader>vb',
        ":lua require('modes').toggle_mode('GIT',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
        { desc = 'Toggle GIT Mode for Current Buffer' }
      )
    end,
  },
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    opts = {
      -- options
      notification = {
        window = {
          winblend = 0,
        },
      },
      progress = {
        display = {
          progress_ttl = 300,
        },
      },
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'conf', 'html', 'javascript', 'typescript', 'lua', 'json', 'xml' },
    opts = {
      'css',
      'conf',
      'html',
      'javascript',
      'typescript',
      'lua',
      'json',
      'xml',
    },
    config = true,
  },
}
