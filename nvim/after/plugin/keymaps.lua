local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Comment Toggle --
map('n','<leader>/',':CommentToggle<CR>')

-- NvimTree splkey: f --
map('n','<leader>ft',':NvimTreeToggle<CR>')
map('n','<leader>ff',':NvimTreeFocus<CR>')

--- Tabs splkey: t --
map('n','<leader>tt',':tabnew<CR>')
map('n','<leader>tp',':tabprevious<CR>')
map('n','<leader>tn',':tabnext<CR>')
map('n','<leader>te',':tabedit')

-- Global splkey: g --
map('n','<leader>gc',':Telescope colorscheme<CR>')

-- markdown preview --
map('n','<leader>mdp',':Glow<CR>')

-- git splkey: v --
map('n','<leader>vb',':GitBlameToggle<CR>')
