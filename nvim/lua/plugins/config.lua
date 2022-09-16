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

-- config --
if_successful('lspconfigs')
if_successful('plugins.configs.keymaps')
if_successful('plugins.configs.basics')
if_successful('plugins.configs.colorscheme')

-- plguins using default config --
utils.if_successful_then_setup('tidy')
utils.if_successful_then_setup('tabby')
utils.if_successful_then_setup('project_nvim')
utils.if_successful_then_setup('numbers')
utils.if_successful_then_setup('nvim-tree')
utils.if_successful_then_setup('colorizer')
utils.if_successful_then_setup('spellsitter')
utils.if_successful_then_setup('regexplainer')
utils.if_successful_then_setup('nvim_comment')

-- plugins with configs --
utils.if_successful_then_setup('plugins.configs.dapui')
utils.if_successful_then_setup('plugins.configs.packer')
utils.if_successful_then_setup('plugins.configs.numbers')
utils.if_successful_then_setup('plugins.configs.lualine')
utils.if_successful_then_setup('plugins.configs.projects')
utils.if_successful_then_setup('plugins.configs.gitsigns')
utils.if_successful_then_setup('plugins.configs.dashboard')
utils.if_successful_then_setup('plugins.configs.indentline')
utils.if_successful_then_setup('plugins.configs.treesitter')
utils.if_successful_then_setup('plugins.configs.cursorline')
utils.if_successful_then_setup('plugins.configs.regexplainer')
