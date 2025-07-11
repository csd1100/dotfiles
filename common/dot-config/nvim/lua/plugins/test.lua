local ku = require('config.keymap-utils')
return {
  'nvim-neotest/neotest',
  dependencies = {
    'csd1100/modes.nvim',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-vim-test',
    'mrcjkb/rustaceanvim',
    'fredrikaverpil/neotest-golang',
  },
  config = function()
    local nt = require('neotest')
    local maps = {
      ['n'] = {
        ['tt'] = {
          ['rhs'] = function()
            nt.run.run()
          end,
          ['opts'] = { desc = 'Run nearest test' },
        },
        ['tf'] = {
          ['rhs'] = function()
            nt.run.run(vim.fn.expand('%'))
          end,
          ['opts'] = { desc = 'Run tests in file' },
        },
        ['td'] = {
          ['rhs'] = function()
            nt.run.run({ strategy = 'dap' })
          end,
          ['opts'] = { desc = 'Run nearest test with debug' },
        },
        ['ts'] = {
          ['rhs'] = function()
            nt.run.stop()
          end,
          ['opts'] = { desc = 'Stops the test' },
        },
        ['ta'] = {
          ['rhs'] = function()
            nt.run.attach()
          end,
          ['opts'] = { desc = 'Attach to a test' },
        },
        ['<leader>to'] = {
          ['rhs'] = function()
            nt.output_panel.toggle()
          end,
          ['opts'] = { desc = 'Attach to a test' },
        },
        ['<leader>ts'] = {
          ['rhs'] = function()
            nt.summary.toggle()
          end,
          ['opts'] = { desc = 'Attach to a test' },
        },
      },
    }
    local name = 'TEST'
    local modes = require('modes')
    modes.create_if_not_present(name, function() end, function() end, '  ')
    modes.add_maps(name, maps)

    ku.map('n', '<leader>tg', function()
      require('modes').toggle_mode(name)
    end, { desc = 'Toggle ' .. name .. ' Mode (Global)' })
    ku.map('n', '<leader>tb', function()
      require('modes').toggle_mode(
        name,
        { buffer = vim.api.nvim_get_current_buf() }
      )
    end, { desc = 'Toggle ' .. name .. ' Mode' })

    require('neotest').setup({
      adapters = {
        require('neotest-plenary'),
        require('neotest-vim-test')({
          allow_file_types = { 'javascript' },
        }),
        require('rustaceanvim.neotest'),
        require('neotest-golang'),
      },
    })
  end,
}
