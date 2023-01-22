local set = vim.opt

local home = os.getenv("HOME")
if not home then
	home = vim.fn.getcwd()
end

local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":~:s?\\~??")

local bkp_dir = home .. "/.nvim/backups"

set.backup = true
set.backupdir = bkp_dir .. "/" .. project

local undo_dir = home .. "/.nvim/undos"
set.undodir = undo_dir .. "/" .. project
