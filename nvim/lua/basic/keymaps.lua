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

-- Clipboard Copy and Paste --
map('v', '<C-S-y>', '"+y')
map('n', '<C-S-p>', '"+p')

-- Map Esc to kk
map('i', 'kk', '<Esc>')
map('i', 'jj', '<Esc><CR>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- autocomplete brackets and quotes
map('n', '<leader>\'', ":lua require('basic.keymaps-utils').Modes.COMPL:toggle()<CR>")
-- add blank line in normal mode
map('n', '<leader><CR>', '$w')

-- mapping exit for convenience --
map('n', ':Q', ':q<CR>')
map('n', 'qq', ':q<CR>')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<leader>tp', ':tabprevious<CR>')
map('n', '<leader>tn', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- fast navigation --
map('n', '<S-s>', '15j')
map('n', '<S-w>', '15k')

-- win navigation --
map('', '<C-h>', ':wincmd h<CR>')
map('', '<C-j>', ':wincmd j<CR>')
map('', '<C-k>', ':wincmd k<CR>')
map('', '<C-l>', ':wincmd l<CR>')
map('', '<C-+>', ':res +3<CR>')
map('', '<C-->', ':res -3<CR>')
