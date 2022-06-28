local set= vim.opt
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
-- set monokai --
-- require('monokai').setup { palette = require('monokai').pro }

-- set everforest --
-- vim.cmd('colorscheme everforest')

-- set sonokai --
vim.cmd('colorscheme sonokai')
