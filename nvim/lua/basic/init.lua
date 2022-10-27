local set = vim.opt

local home = os.getenv('HOME')
if not home then
    home = vim.fn.getcwd()
end

local bkp_dir = os.getenv('NVIM_BACKUP_DIR')
if not bkp_dir then
    bkp_dir = home .. '/.nvim/backups'
end
-- create backup of file before overwrite --
set.backup = true
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ':~:s?\\~??')
set.backupdir = bkp_dir .. '/' .. project

vim.cmd('source ~/.vimrc')
require('basic.keymaps')
