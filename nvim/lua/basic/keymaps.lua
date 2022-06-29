local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Change leader to <Space>
-----------------------------------------------------------
map('n', '<Space>', '<nop>')
vim.g.mapleader=' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('', '<C-l>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- autocomplete brackets and quotes
map('i', '"', '""<left>')
map('i', '\'', '\'\'<left>')
map('i', '(', '()<left>')
map('i', '[', '[]<left>')
map('i', '{', '{}<left>')
map('i', '<', '<><left>')
map('i', '{<CR>', '{<CR>}<ESC>O')

-- add brackets and quotes in visual mode
map('v', '"', [[<ESC>`>a"<ESC>`<i"<ESC>]])
map('v', "'", [[<ESC>`>a'<ESC>`<i'<ESC>]])
map('v', '(', [[<ESC>`>a)<ESC>`<i(<ESC>]])
map('v', '[', [[<ESC>`>a]<ESC>`<i[<ESC>]])
map('v', '{', [[<ESC>`>a}<ESC>`<i{<ESC>]])
map('v', '<', [[<ESC>`>a><ESC>`<i<<ESC>]])

-- add blank line in normal mode
map('n','<leader><CR>','i<CR><Esc>')
