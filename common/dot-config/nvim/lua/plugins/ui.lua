local ku = require('config.keymap-utils')

return {
  {
    'nvim-telescope/telescope.nvim',
    commit = '5255aa27c422de944791318024167ad5d40aad20',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        commit = '74b06c6c75e4eeb3108ec01852001636d85a932b',
      },
      {
      'nvim-telescope/telescope-live-grep-args.nvim',
      commit = '53e9df55b3651dd7cf77e172f1e8c9a17407acca',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        commit = 'b25b749b9db64d375d782094e2b9dce53ad53a40',
        build = 'make'
      },
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

      telescope.load_extension('fzf')
      telescope.load_extension('live_grep_args')
    end,
  },
  {
    'folke/which-key.nvim',
    commit = '3aab2147e74890957785941f0c1ad87d0a44c15a',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    commit = '131a558e13f9f28b15cd235557150ccb23f89286',
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
    'folke/trouble.nvim',
    commit = 'bd67efe408d4816e25e8491cc5ad4088e708a69a',
    cmd = 'Trouble',
    config = true,
    keys = {
      {
        '<leader>tD',
        '<cmd>Trouble diagnostics toggle focus=true<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>td',
        '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    commit = 'dd3f588bacbeb041be6facf1742e42097f62165d',
    event = 'VeryLazy',
    dependencies = {
      'csd1100/modes.nvim',
    },
    opts = {
      numhl = false,
      signs_staged = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '┃' },
        untracked = { text = '┆' },
      },
      signs = {
        add = { text = '║' },
        change = { text = '║' },
        delete = { text = '║' },
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
      local name = 'GIT'
      modes.create_if_not_present(name, function() end, function() end, '  ')
      modes.add_maps(name, gitModeMaps)
      ku.map('n', '<leader>vg', function()
        require('modes').toggle_mode(name)
      end, { desc = 'Toggle ' .. name .. ' Mode (Global)' })
      ku.map('n', '<leader>vb', function()
        require('modes').toggle_mode(
          name,
          { buffer = vim.api.nvim_get_current_buf() }
        )
      end, { desc = 'Toggle ' .. name .. ' Mode' })
    end,
  }
}
