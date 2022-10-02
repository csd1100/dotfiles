local utilsModule = require('basic.keymaps-utils')
local map = utilsModule.map
-----------------------------------------------------------
-- Change leader to <Space>
-----------------------------------------------------------
map('n', '<Space>', '<nop>')
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('', '<C-l>', '<nop>')
map('n', '<C-S-E>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')
map('i', 'jj', '<Esc><CR>i')

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
map('n', '<leader><CR>', 'i<CR><Esc>')

-- mapping exit for convenience --
map('n', ':Q', ':q<CR>')
map('n', 'qq', ':q<CR>')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<leader>tp', ':tabprevious<CR>')
map('n', '<leader>tn', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- win navigation --
map('', '<C-h>', ':wincmd h<CR>')
map('', '<C-j>', ':wincmd j<CR>')
map('', '<C-k>', ':wincmd k<CR>')
map('', '<C-l>', ':wincmd l<CR>')
map('', '<C-+>', ':res +3<CR>')
map('', '<C-->', ':res -3<CR>')
