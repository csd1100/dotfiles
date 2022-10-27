local set = vim.opt
local g = vim.g

-- start the spellsitter --
set.spell = true

-- glow setup --
g.glow_binary_path = vim.env.HOME .. '/bin'
g.glow_border = 'rounded'
