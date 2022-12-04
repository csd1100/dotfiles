local g = vim.g
local set = vim.opt
-- vim opts for colors and background --
set.termguicolors = true
set.background = "light"

-- sonokai conf --
g.sonokai_style = "default"
g.sonokai_better_performance = 1

-- gruvbox-material conf --
g.gruvbox_material_background = "hard"
g.gruvbox_material_foreground = "mix"

require("catppuccin").setup({
    flavour = "latte",
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
})

local theme = "sonokai"
-- set theme --
vim.cmd("colorscheme " .. theme)
