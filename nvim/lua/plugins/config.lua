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
if_successful('tidy').setup()
if_successful('tabby').setup()
if_successful('project_nvim').setup()
if_successful('numbers').setup()
if_successful('nvim-tree').setup()
if_successful('colorizer').setup()
if_successful('spellsitter').setup()
if_successful('regexplainer').setup()
if_successful('nvim_comment').setup()

-- plugins with configs --
if_successful('plugins.configs.dapui').setup()
if_successful('plugins.configs.packer').setup()
if_successful('plugins.configs.numbers').setup()
if_successful('plugins.configs.lualine').setup()
if_successful('plugins.configs.projects').setup()
if_successful('plugins.configs.gitsigns').setup()
if_successful('plugins.configs.dashboard').setup()
if_successful('plugins.configs.indentline').setup()
if_successful('plugins.configs.treesitter').setup()
if_successful('plugins.configs.cursorline').setup()
if_successful('plugins.configs.regexplainer').setup()
