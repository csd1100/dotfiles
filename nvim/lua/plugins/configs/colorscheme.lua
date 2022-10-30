local set = vim.opt
local g = vim.g

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

-- grubbox-material conf --
g.gruvbox_material_background = 'hard'

-- set monokai --
-- local status, monokai = pcall(require, 'monokai')
-- if not status then
--     print('failed to load ' .. 'monokai')
--     return
-- end
-- monokai.setup {
--     palette = monokai.pro
-- }

-- set everforest --
-- vim.cmd('colorscheme everforest')

-- set sonokai --
-- vim.cmd('colorscheme sonokai')

-- set everforest --
vim.cmd('colorscheme gruvbox-material')

-- set gruvbox --
-- vim.cmd('colorscheme gruvbox')
