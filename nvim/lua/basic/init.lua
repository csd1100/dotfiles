local set = vim.opt
local home = os.getenv 'HOME'

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
set.backupdir = home .. '/.nvim/backups/' .. project

-- show command --
set.showcmd = true

-- set.encoding --
set.encoding = 'utf-8'

require('basic.keymaps')
