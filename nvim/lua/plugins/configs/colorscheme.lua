local set = vim.opt
local g = vim.g

local status, monokai = pcall(require, 'monokai')
if not status then
    print('failed to load ' .. 'monokai')
    return
end

-- vim opts for colors and background --
set.termguicolors = true
set.background = 'dark'

-- everforest conf --
g.everforest_better_performance = 1
g.everforest_background = 'hard'
g.everforest_ui_contrast = 'high'

-- sonokai conf --
g.sonokai_style = 'atlantis'
g.sonokai_better_performance = 1

-- aqurarium conf --
g.aquarium_style = "dark"

-- set monokai --
monokai.setup {
    palette = monokai.pro
}

-- set everforest --
-- vim.cmd('colorscheme everforest')

-- set aquarium --
-- vim.cmd('colorscheme aquarium')

-- set moon schemes --
-- vim.cmd('colorscheme orange-moon')

-- set sonokai --
-- vim.cmd('colorscheme sonokai')

-- set gruvbox --
-- vim.cmd('colorscheme gruvbox')
