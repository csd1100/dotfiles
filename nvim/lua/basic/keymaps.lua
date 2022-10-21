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
map('n', '<C-p>', '"+p')
-- yank text in reg 6
map('v', '""', '"6y')
-- replace current word with text from reg 6
map('n', 'cp', 'h"6p<Esc>lde')
-- replace from current pos to end of the line with text from reg 6
map('n', '[]', 'h"6p<Esc>ld$')

-- Map Esc --
map('i', 'kk', '<Esc>')
map('i', 'lll', '<Esc>l')
map('i', 'hhh', '<Esc>h')
map('i', 'jj', '<Esc>')

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
map('n', 'qa', ':qa<CR>')
map('n', 'wqa', ':wqa<CR>')
map('n', 'sx', ':wq<CR>')
map('n', 'sw', ':w<CR>')
map('n', 'zz', ':wqa<CR>')
map('n', 'zx', ':SessionManager save_current_session<CR>:wqa<CR>')
map('n', '55', 'q5')
map('n', ',', '@5')
map('n', '<C-f>','/')
map('n', '<C-S-h>',':s/')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<C-Right>', ':tabprevious<CR>')
map('n', '<C-Left>', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- Buffer --
map('n', 'qb', ':bd<CR>')

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
