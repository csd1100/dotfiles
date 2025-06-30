local modes = require('modes')
local name = 'R:LSP'
modes.create_if_not_present(name, function() end, function() end, '  ')
local lsp_maps = require('config.lsp-keymaps')

local maps = {
  ['n'] = {
    ['Q'] = {
      ['rhs'] = function()
        vim.cmd.RustLsp('codeAction')
      end,
      ['opts'] = { desc = 'Code Action' },
    },
    ['K'] = {
      ['rhs'] = function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end,
      ['opts'] = { desc = 'Hove Action' },
    },
    ['?'] = {
      ['rhs'] = function()
        vim.cmd.RustLsp({ 'explainError', 'current' })
      end,
      ['opts'] = { desc = 'Explain Current Error' },
    },
  },
}
modes.add_maps(name, vim.tbl_deep_extend('force', lsp_maps, maps))
modes.enable_mode(name, { buffer = vim.api.nvim_get_current_buf() })
