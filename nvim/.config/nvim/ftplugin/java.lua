local function file_exists(name)
    local f = io.open(name, "r")
    return f ~= nil and io.close(f)
end

local function keymap(bufnr)
    local lsp_keymaps = require("config.lsp-keymaps")

    local status, modes_module = pcall(require, "modes")
    if not status then
        print(
            "modes plugin not installed or not properly configured,activating only basic keymaps directly"
        )
        lsp_keymaps.map_lsp_keys(bufnr)
        return
    end

    local lspActivate = function(options)
        lsp_keymaps.map_jdtls_keys(options.buffer)
    end
    local lspDeactivate = function(options)
        lsp_keymaps.unmap_jdtls_keys(options.buffer)
    end

    modes_module.create_if_not_present("JLSP", lspActivate, lspDeactivate, "{}")
    modes_module.toggle_mode("JLSP", { buffer = bufnr })
end

if not file_exists(vim.fn.stdpath("data") .. "/mason/bin/jdtls") then
    vim.notify("jdtls not installed. Install jdtls using mason.", "error")
    return
end

local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv("NVIM_JAVA_WORKSPACE_DIR")
if not workspace_dir then
    workspace_dir = home .. "/work/java/workspace" .. "/" .. project_name
end

local bundles = {}

local java_debug_adapter = vim.split(
    vim.fn.glob(
        vim.fn.stdpath("data")
            .. "/mason/packages/java-debug-adapter/extension/server/"
            .. "com.microsoft.java.debug.plugin-*.jar",
        1
    ),
    "\n"
)

if not vim.tbl_isempty(java_debug_adapter) then
    vim.list_extend(bundles, java_debug_adapter)
end

local java_test = vim.split(
    vim.fn.glob(
        vim.fn.stdpath("data")
            .. "/mason/packages/java-test/"
            .. "extension/server/*.jar",
        1
    ),
    "\n"
)

if not vim.tbl_isempty(java_test) then
    vim.list_extend(bundles, java_test)
end

local config = {
    cmd = {
        home .. "/.local/share/nvim/mason/bin/jdtls",
        "-Xmx4g",
        "-data",
        workspace_dir,
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = os.getenv("JAVA_11_HOME"),
                    },
                    {
                        name = "JavaSE-17",
                        path = os.getenv("JAVA_17_HOME"),
                    },
                    {
                        name = "JavaSE-20",
                        path = os.getenv("JAVA_20_HOME"),
                    },
                },
            },
        },
    },
    init_options = {
        bundles = bundles,
    },
    on_attach = function(_, bufnr)
        keymap(bufnr)
        require("jdtls.setup").add_commands()
        require("jdtls").setup_dap({ hotcodereplace = "auto" })
    end,
    handler = { ["language/status"] = function() end },
}
require("jdtls").start_or_attach(config)
