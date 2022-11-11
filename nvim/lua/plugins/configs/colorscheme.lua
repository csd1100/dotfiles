local g = vim.g

-- everforest conf --
g.everforest_better_performance = 1
g.everforest_background = 'hard'
g.everforest_ui_contrast = 'high'

-- sonokai conf --
g.sonokai_style = 'maia'
g.sonokai_better_performance = 1

-- grubbox-material conf --
g.gruvbox_material_background = 'hard'

-- set monokai --
-- local status, monokai = pcall(require, 'monokai')
-- if not status then
--     vim.notify('failed to load monokai', 'error')
--     return
-- end
-- monokai.setup {
--     palette = monokai.pro
-- }

-- set everforest --
-- vim.cmd('colorscheme everforest')

-- set sonokai --
vim.cmd('colorscheme sonokai')

-- set gruvbox-material --
-- vim.cmd('colorscheme gruvbox-material')

-- set gruvbox --
-- vim.cmd('colorscheme gruvbox')
--

-- tokyonight --
-- local status, tokyonight = pcall(require, 'tokyonight')
-- if not status then
--     vim.notify('failed to load tokyonight', 'error')
--     return
-- end
-- tokyonight.setup {
--     style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
-- }
-- vim.cmd('colorscheme tokyonight')
