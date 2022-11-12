local status, tsserver = pcall(require, "typescript")
if not status then
	vim.notify("failed to load tsserver", "error")
	return
end

local lsp_conf = require("lspconfigs.js.tsserver")
if not lsp_conf.config._initialized then
	lsp_conf.config._initialized = true
	tsserver.setup(lsp_conf.config)
	require("lspconfigs.dap.javascript").setup()
end
