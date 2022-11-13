local modesModule = require("basic.modes")

local keymapUtils = require("basic.keymaps-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap
-----------------------------------------------------------
-- Change leader to <Space>
-----------------------------------------------------------
map("n", "<Space>", "<nop>")
vim.g.mapleader = " "

map("n", "<C-f>", "/", { desc = "Find using /" })
map("n", "<C-S-h>", ":s/", { desc = "Substitution using :s" })

--- Tabs splkey: t --
map("n", "<leader>tt", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<C-Right>", ":tabnext<CR>", { desc = "Previous Tab" })
map("n", "<C-Left>", ":tabprevious<CR>", { desc = "Next Tab" })
map("n", "<leader>te", ":tabedit", { desc = "Open file in new Tab" })

-- win navigation --
map("", "<C-h>", ":wincmd h<CR>", { desc = "Window Left" })
map("", "<C-j>", ":wincmd j<CR>", { desc = "Window Down" })
map("", "<C-k>", ":wincmd k<CR>", { desc = "Window Up" })
map("", "<C-l>", ":wincmd l<CR>", { desc = "Window Right" })
map("", "<C-+>", ":res +3<CR>", { desc = "Resize Window By +3" })
map("", "<C-->", ":res -3<CR>", { desc = "Resize Window By -3" })

local completionToggleFn = function(self)
	if self:isActive() then
		-- add brackets and quotes in visual mode
		map("v", '"', [[<ESC>`>a"<ESC>`<i"<ESC>]])
		map("v", "'", [[<ESC>`>a'<ESC>`<i'<ESC>]])
		map("v", "`", [[<ESC>`>a`<ESC>`<i`<ESC>]])
		map("v", "(", [[<ESC>`>a)<ESC>`<i(<ESC>]])
		map("v", "[", [[<ESC>`>a]<ESC>`<i[<ESC>]])
		map("v", "{", [[<ESC>`>a}<ESC>`<i{<ESC>]])
		map("i", '"', '""<left>')
		map("i", "'", "''<left>")
		map("i", "`", "``<left>")
		map("i", "'", "''<left>")
		map("i", "(", "()<left>")
		map("i", "[", "[]<left>")
		map("i", "{", "{}<left>")
		map("i", "<", "<><left>")
		map("i", "{<CR>", "{<CR>}<ESC>O")
	else
		unmap("v", '"')
		unmap("v", "`")
		unmap("v", "'")
		unmap("v", "(")
		unmap("v", "[")
		unmap("v", "{")
		unmap("i", '"')
		unmap("i", "`")
		unmap("i", "'")
		unmap("i", "(")
		unmap("i", "[")
		unmap("i", "{")
		unmap("i", "<")
		unmap("i", "{<CR>")
	end
end

local COMPL = modesModule.createMode("COMPL", "''", completionToggleFn)
-- enable quotes completion by default --
COMPL:toggle()

-- autocomplete brackets and quotes
map("n", "<leader>'", ":lua require('basic.modes').getMode('COMPL'):toggle()<CR>", { desc = "Toggle COMPL Mode" })
