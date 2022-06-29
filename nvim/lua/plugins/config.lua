local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

-- config --
require('lspconfigs')
require('plugins.configs.keymaps')
require('plugins.configs.basics')
require('plugins.configs.colorscheme')

-- plguins using default config --
if_successful('tidy').setup()
if_successful('tabby').setup()
if_successful('numbers').setup()
if_successful('nvim-tree').setup()
if_successful('colorizer').setup()
if_successful('spellsitter').setup()
if_successful('regexplainer').setup()
if_successful('nvim_comment').setup()
-- plugins with configs --
require('plugins.configs.dapui').setup()
require('plugins.configs.packer').setup()
require('plugins.configs.lualine').setup()
require('plugins.configs.dashboard').setup()
require('plugins.configs.indentline').setup()
require('plugins.configs.treesitter').setup()
require('plugins.configs.cursorline').setup()
