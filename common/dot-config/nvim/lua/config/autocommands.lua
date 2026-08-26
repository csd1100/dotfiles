local ft_autocommands = vim.api.nvim_create_augroup('FTAutoCommands', {})
vim.api.nvim_create_autocmd('FileType', {
  group = ft_autocommands,
  pattern = { 'lua', 'yaml', 'markdown', 'shell' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

local trim_trailing_whitespace =
  vim.api.nvim_create_augroup('TrimTrailingWhitespace', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = trim_trailing_whitespace,
  callback = function()
    if vim.bo.filetype == 'markdown' then
      return
    end
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
