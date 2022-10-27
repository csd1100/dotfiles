local utilsModule = require('basic.keymaps-utils')
local map = utilsModule.map
-----------------------------------------------------------
-- Change leader to <Space>
-----------------------------------------------------------
map('n', '<Space>', '<nop>')
vim.g.mapleader = ' '

-- autocomplete brackets and quotes
map('n', '<leader>\'', ":lua require('basic.keymaps-utils').Modes.COMPL:toggle()<CR>")

map('n', '<C-f>','/')
map('n', '<C-S-h>',':s/')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<C-Right>', ':tabprevious<CR>')
map('n', '<C-Left>', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- win navigation --
map('', '<C-h>', ':wincmd h<CR>')
map('', '<C-j>', ':wincmd j<CR>')
map('', '<C-k>', ':wincmd k<CR>')
map('', '<C-l>', ':wincmd l<CR>')
map('', '<C-+>', ':res +3<CR>')
map('', '<C-->', ':res -3<CR>')
