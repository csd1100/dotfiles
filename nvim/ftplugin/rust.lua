local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
	vim.notify("failed to load rust-tools", "error")
	return
end

local rust_lsp_conf = require("lspconfigs.rust.rust-analyzer")
if not rust_lsp_conf.config._initialized then
	rust_lsp_conf.config._initialized = true
	rust_tools.setup(rust_lsp_conf.config)
end
