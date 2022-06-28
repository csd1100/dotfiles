local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end


local home = os.getenv "HOME"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/programming/java/workspace/' .. project_name

local jdtls_lib = if_successful('jdtls')
local jdtls_dap = if_successful('jdtls.dap')

local servers = require("nvim-lsp-installer.servers")
local _, jdtls = servers.get_server("jdtls")

local bundles = {vim.fn.glob(home .. "/bin/java-debug/com.microsoft.java.debug.plugin-*.jar")};
local config = jdtls:get_default_options()

vim.list_extend(config['cmd'], {'-data', workspace_dir})
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/bin/vscode-java-test/*.jar"), "\n"))
config['root_dir'] = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
config['init_options'] = {
    bundles = bundles
}
config['on_attach'] = function(client, bufnr)
    jdtls_lib.setup_dap({
        hotcodereplace = 'auto'
    })
    jdtls_dap.setup_dap_main_class_configs()
end

jdtls_lib.start_or_attach(config)

