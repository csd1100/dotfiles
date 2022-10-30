local utils = require('basic.utils')

local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

-- fast loading --
if_successful('impatient')
require('plugins.configs.packer')

-- config --
if_successful('plugins.configs.keymaps')
if_successful('plugins.configs.basics')
if_successful('plugins.configs.colorscheme')

-- plguins using default config --
utils.if_successful_then_setup('tidy')
utils.if_successful_then_setup('nvim-tree')
utils.if_successful_then_setup('colorizer')
utils.if_successful_then_setup('spellsitter')
utils.if_successful_then_setup('project_nvim')
utils.if_successful_then_setup('nvim_comment')

-- plugins with configs --
require('plugins.configs.test')
require('plugins.configs.dapui')
require('plugins.configs.numbers')
require('plugins.configs.lualine')
require('plugins.configs.projects')
require('plugins.configs.gitsigns')
require('plugins.configs.dashboard')
require('plugins.configs.indentline')
require('plugins.configs.toggleterm')
require('plugins.configs.treesitter')
require('plugins.configs.cursorline')
require('plugins.configs.regexplainer')
require('plugins.configs.sessions_manager')
require('plugins.configs.tabby')

-- lsp --
if_successful('lspconfigs')
