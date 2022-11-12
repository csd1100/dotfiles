local g = vim.g
local set = vim.opt
-- vim opts for colors and background --
set.termguicolors = true
set.background = "dark"

-- sonokai conf --
g.sonokai_style = "maia"
g.sonokai_better_performance = 1

-- gruvbox-material conf --
g.gruvbox_material_background = "hard"
g.gruvbox_material_foreground = "mix"

local theme = "gruvbox-material"
-- set theme --
vim.cmd("colorscheme " .. theme)
