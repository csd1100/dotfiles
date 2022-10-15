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
map('n', '<leader><CR>', 'i<CR><Esc>')
map('n', '<leader>j', 'o<Esc>j')

-- mappings for convenience --
map('n', ':W', ':w<CR>')
map('n', ':Q', ':q<CR>')
map('n', 'qq', ':q<CR>')
map('n', 'wq', ':wq<CR>')
map('n', 'zx', ':SessionSave<CR>:wqa<CR>')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<C-Right>', ':tabprevious<CR>')
map('n', '<C-Left>', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- Buffer --
map('n', 'bk', ':bd<CR>')

-- fast navigation --
map('n', '<S-s>', '15j')
map('n', '<S-w>', '15k')
map('v', '<S-s>', '10j')
map('v', '<S-w>', '10k')

-- win navigation --
map('', '<C-h>', ':wincmd h<CR>')
map('', '<C-j>', ':wincmd j<CR>')
map('', '<C-k>', ':wincmd k<CR>')
map('', '<C-l>', ':wincmd l<CR>')
map('', '<C-+>', ':res +3<CR>')
map('', '<C-->', ':res -3<CR>')
