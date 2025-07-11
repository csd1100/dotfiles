local ku = require('config.keymap-utils')
return {

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'csd1100/modes.nvim',
      {
        'igorlfs/nvim-dap-view',
        opts = {},
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = true,
      },
    },
    config = function()
      local dap = require('dap')
      local view = require('dap-view')
      local maps = {
        ['n'] = {
          ['<leader>b'] = {
            ['rhs'] = function()
              dap.toggle_breakpoint()
            end,
            ['opts'] = { desc = 'Add breakpoint' },
          },
          ['<F5>'] = {
            ['rhs'] = function()
              dap.continue()
            end,
            ['opts'] = { desc = 'Start or Resume Debugger' },
          },
          ['<F7>'] = {
            ['rhs'] = function()
              dap.step_into()
            end,
            ['opts'] = { desc = 'Step Into' },
          },
          ['<F8>'] = {
            ['rhs'] = function()
              dap.step_over()
            end,
            ['opts'] = { desc = 'Step Over' },
          },
          ['<leader>do'] = {
            ['rhs'] = function()
              view.toggle()
            end,
            ['opts'] = { desc = 'View Debugger UI' },
          },
          ['<F1>'] = {
            ['rhs'] = function()
              view.show_view('breakpoints')
            end,
            ['opts'] = { desc = 'Show Breakpoints' },
          },
          ['<F2>'] = {
            ['rhs'] = function()
              view.show_view('watches')
            end,
            ['opts'] = { desc = 'Show Watches' },
          },
          ['<F3>'] = {
            ['rhs'] = function()
              view.show_view('repl')
            end,
            ['opts'] = { desc = 'Show REPL' },
          },
          ['<F4>'] = {
            ['rhs'] = function()
              view.show_view('threads')
            end,
            ['opts'] = { desc = 'Show Threads' },
          },
          ['<F10>'] = {
            ['rhs'] = function()
              view.show_view('console')
            end,
            ['opts'] = { desc = 'Show Console' },
          },
          ['<F11>'] = {
            ['rhs'] = function()
              view.show_view('exceptions')
            end,
            ['opts'] = { desc = 'Show Exceptions' },
          },
          ['<F12>'] = {
            ['rhs'] = function()
              view.show_view('scopes')
            end,
            ['opts'] = { desc = 'Show Scopes' },
          },
        },
      }

      local name = 'DEBUG'
      local modes = require('modes')
      modes.create_if_not_present(
        name,
        function() end,
        function() end,
        '   '
      )
      modes.add_maps(name, maps)

      ku.map('n', '<leader>dg', function()
        require('modes').toggle_mode(name)
      end, { desc = 'Toggle ' .. name .. ' Mode (Global)' })
      ku.map('n', '<leader>db', function()
        require('modes').toggle_mode(
          name,
          { buffer = vim.api.nvim_get_current_buf() }
        )
      end, { desc = 'Toggle ' .. name .. ' Mode' })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    config = function()
      require('dap-go').setup()
    end,
  },
}
