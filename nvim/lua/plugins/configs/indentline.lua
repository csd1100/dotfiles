local status, ib = pcall(require, "indent_blankline")
if not status then
	vim.notify("failed to load indent_blankline", "error")
	return
end

local set = vim.opt

set.list = true
set.listchars:append("space:⋅")
set.listchars:append("eol:↴")

local conf = {
	show_end_of_line = true,
	space_char_blankline = " ",
}

ib.setup(conf)
