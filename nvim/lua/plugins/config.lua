-- config --
require('lspconfigs')
require('plugins.configs.keymaps')
require('plugins.configs.basics')
require('plugins.configs.colorscheme')

-- plguins using default config --
require('tidy').setup()
require('tabby').setup()
require('numbers').setup()
require('nvim-tree').setup()
require('colorizer').setup()
require('spellsitter').setup()
require('regexplainer').setup()
require('nvim_comment').setup()

-- plugins with configs --
require('plugins.configs.test').setup()
require('plugins.configs.packer').setup()
require('plugins.configs.lualine').setup()
require('plugins.configs.dashboard').setup()
require('plugins.configs.indentline').setup()
require('plugins.configs.treesitter').setup()
require('plugins.configs.cursorline').setup()





