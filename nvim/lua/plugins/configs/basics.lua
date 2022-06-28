local set = vim.opt
local g = vim.g

-- start the spellsitter --
set.spell = true

-- git blame exclude --
g.gitblame_ignored_filetypes = {'dashboard', 'NvimTree'}

-- glow setup --
g.glow_binary_path = vim.env.HOME .. '/bin'
g.glow_border = 'rounded'
