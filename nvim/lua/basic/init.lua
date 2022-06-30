local set = vim.opt

local home = os.getenv('HOME')
if not home then
    home = vim.fn.getcwd()
end

local bkp_dir = os.getenv('NVIM_BACKUP_DIR')
if not bkp_dir then
    bkp_dir = home .. '/.nvim/backups'
end
-- enable line-numbers --
set.number = true
set.relativenumber = true
-- set.indent usint Tab to 4 spaces --
set.expandtab = true
set.tabstop = 4
set.softtabstop = -1
set.shiftwidth = 0

-- highlight search items --
set.hlsearch = true

-- create backup of file before overwrite --
set.backup = true
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ':~:s?\\~??')
set.backupdir = bkp_dir .. '/' .. project

-- show command --
set.showcmd = true

-- set.encoding --
set.encoding = 'utf-8'

require('basic.keymaps')
