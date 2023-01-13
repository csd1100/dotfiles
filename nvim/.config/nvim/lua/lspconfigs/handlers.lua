local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("failed to load lspconfig", "error")
	return
end

local status, fidget = pcall(require, "fidget")
if status then
    fidget.setup()
end

local keymapUtils = require("basic.keymaps-utils")

local mason_conf = {
	ensure_installed = { "sumneko_lua", "bashls" },
	automatic_installation = { "jdtls@1.12.0", "typescript-language-server", "rust-analyzer" },
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local on_attached = function(client, bufnr)
	local lsp_keymaps = require("lspconfigs.keymaps")

	local status, modesModule = pcall(require, "modes")
	if not status then
		print("modes plugin not installed or not properly configured, activating keymaps directly")
		lsp_keymaps.map_lsp_keys(bufnr)
		return
	end

	local lspActivate = function(options)
		lsp_keymaps.map_lsp_keys(options.buffer)
	end
	local lspDeactivate = function(options)
		lsp_keymaps.unmap_lsp_keys(options.buffer)
	end

	modesModule.createIfNotPresent("LSP", lspActivate, lspDeactivate, "{}")
	modesModule.toggleMode("LSP", { buffer = bufnr })
end

local default_capabilities = vim.lsp.protocol.make_client_capabilities()

local function setup_custom_configs(server_name, plug, module, on_attach, capabilities, doSetup)
	local status, plugin = pcall(require, plug)
	if not status then
		vim.notify("failed to load " .. plug .. " loading mason config", "error")
		lspconfig[server_name].setup({
			on_attach = on_attached,
			capabilities = capabilities,
		})
		return
	else
		require(module).update_config(on_attach, capabilities)
		if doSetup then
			plugin.setup(require(module).config)
		end
	end
end

local M = {}

function M.setup()
	local status, lspconfig = pcall(require, "lspconfig")
	if not status then
		vim.notify("failed to load lspconfig", "error")
		return
	end

	local status, cnl = pcall(require, "cmp_nvim_lsp")
	if not status then
		vim.notify("failed to load cmp_nvim_lsp", "error")
		return
	end

	local status, mason = pcall(require, "mason")
	if not status then
		vim.notify("failed to load mason", "error")
		return
	end

	local status, lspi = pcall(require, "mason-lspconfig")
	if not status then
		vim.notify("failed to load mason-lspconfig", "error")
		return
	end

	lspi.setup(mason_conf)

	default_capabilities = cnl.default_capabilities(default_capabilities)

	lspi.setup_handlers({
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup({
				on_attach = on_attached,
				capabilities = default_capabilities,
			})
		end,
		["jdtls"] = function(server_name)
			setup_custom_configs(server_name, "jdtls", "lspconfigs.java.jdtls", nil, default_capabilities)
		end,
		["rust_analyzer"] = function(server_name)
			setup_custom_configs(
				server_name,
				"rust-tools",
				"lspconfigs.rust.rust-analyzer",
				on_attached,
				default_capabilities,
				true
			)
		end,
		["tsserver"] = function(server_name)
			setup_custom_configs(
				server_name,
				"typescript",
				"lspconfigs.js.tsserver",
				on_attached,
				default_capabilities,
				true
			)
		end,
		["sumneko_lua"] = function(server_name)
			require("lspconfigs.lua.sumneko_lua").update_config(on_attached, default_capabilities)
		end,
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
