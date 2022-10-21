local utils = require('basic.utils')
local keymapUtils = require('basic.keymaps-utils')

local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local home = os.getenv('HOME')
if not home then
    home = vim.fn.getcwd()
end

local workspace_dir = os.getenv('NVIM_JAVA_WORKSPACE_DIR')
if not workspace_dir then
    workspace_dir = home .. '/work/java/workspace' .. '/' .. project_name
end
print(workspace_dir)

local jdtls_lib = if_successful('jdtls')
local jdtls_dap = if_successful('jdtls.dap')

local servers = if_successful('nvim-lsp-installer.servers')
local _, jdtls = servers.get_server('jdtls')

local bundles = {vim.fn.glob(home .. '/bin/java-debug/com.microsoft.java.debug.plugin-*.jar')};
local config = jdtls:get_default_options()

vim.list_extend(config['cmd'], {'-data', workspace_dir})
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/bin/vscode-java-test/*.jar'), '\n'))
config['root_dir'] = if_successful('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
config['init_options'] = {
    bundles = bundles
}
config['on_attach'] = function(client, bufnr)
    utils.if_successful_then_setup('lspconfigs.java.jdtls')
    keymapUtils.Modes.LSP:toggle()
    jdtls_lib.setup_dap({
        hotcodereplace = 'auto'
    })
    jdtls_dap.setup_dap_main_class_configs()
    local dap = if_successful('dap')
    dap.configurations.java = {{
        type = 'java',
        request = 'attach',
        name = 'Debug (Attach) - Remote',
        hostName = '127.0.0.1',
        port = 8000
    }}

end

print("loaded java ftplugin")
jdtls_lib.start_or_attach(config)
