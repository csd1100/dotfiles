local keymapUtils = require("basic.keymaps-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap
-----------------------------------------------------------
-- Change leader to <Space>
-----------------------------------------------------------
map("n", "<Space>", "<nop>")
vim.g.mapleader = " "

map("n", "<C-f>", "/", { desc = "Find using /" })
map("n", "<C-h>", ":s/", { desc = "Substitution using :s" })
map("n", "<C-S-h>", ":%s/", { desc = "Substitution using :%s" })

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
