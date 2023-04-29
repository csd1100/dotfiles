local function file_exists(name)
	local f = io.open(name, "r")
	return f ~= nil and io.close(f)
end

local function keymap(bufnr)
	local lsp_keymaps = require("config.lsp-keymaps")

	local status, modesModule = pcall(require, "modes")
	if not status then
		print("modes plugin not installed or not properly configured,activating only basic keymaps directly")
		lsp_keymaps.map_lsp_keys(bufnr)
		return
	end

	local lspActivate = function(options)
		lsp_keymaps.map_jdtls_keys(options.buffer)
	end
	local lspDeactivate = function(options)
		lsp_keymaps.unmap_jdtls_keys(options.buffer)
	end

	modesModule.createIfNotPresent("JLSP", lspActivate, lspDeactivate, "{}")
	modesModule.toggleMode("JLSP", { buffer = bufnr })
end

local home = os.getenv("HOME")

if not file_exists(home .. "/.local/share/nvim/mason/bin/jdtls") then
	vim.notify("jdtls not installed. Install jdtls using mason.", "error")
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv("NVIM_JAVA_WORKSPACE_DIR")
if not workspace_dir then
	workspace_dir = home .. "/work/java/workspace" .. "/" .. project_name
end

local bundles = {
	vim.fn.glob(
		home
			.. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
		1
	),
	vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n"),
}

local config = {
  cmd = {
      home .. "/.local/share/nvim/mason/bin/jdtls",
    '-data', workspace_dir
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = bundles
  },
  on_attach = function (_, bufnr)
    keymap(bufnr)
  end
}
require('jdtls').start_or_attach(config)
