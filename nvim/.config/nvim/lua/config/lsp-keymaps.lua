local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local M = {}

function M.map_lsp_keys(bufnr)
    map("n", "<leader>i", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover Info (LSP)" })
	map("n", "<C-g>", function() vim.cmd[[Telescope lsp_document_symbols]] end, { buffer = bufnr, desc = "All symbols (LSP)" })
	map("n", "<C-i>", function() vim.cmd[[Telescope lsp_implementations]] end, { buffer = bufnr, desc = "Implementation (LSP)" })
	map("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "Definition (LSP)" })
	map("n", "<C-S-u>", function() vim.cmd[[Telescope lsp_references]] end, { buffer = bufnr, desc = "All Usages (LSP)" })
	map("n", "<C-S-->", function() vim.cmd[[Telescope lsp_incoming_calls]] end, { buffer = bufnr, desc = "Incoming Calls (LSP)" })
	map("n", "<C-S-=>", function() vim.cmd[[Telescope lsp_outgoing_calls]] end, { buffer = bufnr, desc = "Outgoing Calls (LSP)" })
	map("n", "<leader>lk", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature Help (LSP)" })
	map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature Help (LSP)" })
	map(
		"n",
		"<leader>ltd",
		function() vim.lsp.buf.type_definition() end,
		{ buffer = bufnr, desc = "Type Definition (LSP)" }
	)
	map("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename (LSP)" })
	map("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Code Actions (LSP)" })
	map("v", "<leader>lca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Code Actions (LSP)" })
	map("n", "<leader>lf", function() vim.lsp.buf.format() end, { buffer = bufnr, desc = "Format (LSP)" })

	map(
		"n",
		"<leader>wa",
		function() vim.lsp.buf.add_workspace_folder() end,
		{ buffer = bufnr, desc = "Add Workspace Folder (LSP)" }
	)
	map(
		"n",
		"<leader>wr",
		function() vim.lsp.buf.remove_workspace_folder() end,
		{ buffer = bufnr, desc = "Remove Workspace Folder (LSP)" }
	)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { buffer = bufnr, desc = "List Workspace Folders (LSP)" })

	map("n", "<leader>lo", function() vim.diagnostic.open_float() end, { buffer = bufnr, desc = "Open LSP Diagnostics" })
	map(
		"n",
		"<leader>l<up>",
		function() vim.diagnostic.goto_prev() end,
		{ buffer = bufnr, desc = "Go To Previous Diagnostics" }
	)
	map(
		"n",
		"<leader>l<down>",
		function() vim.diagnostic.goto_next() end,
		{ buffer = bufnr, desc = "Go To Next Diagnostics" }
	)
	map("n", "<leader>lq", function() vim.diagnostic.setloclist() end, { buffer = bufnr, desc = "LSP Diagnostics List" })
end

function M.unmap_lsp_keys(bufnr)
    	local opts = {
		buffer = bufnr,
	}
	unmap("n", "<leader>i", opts)
	unmap("n", "<C-g>", opts)
	unmap("n", "<C-i>", opts)
	unmap("n", "gd", opts)
	unmap("n", "<C-S-u>", opts)
	unmap("n", "<C-S-->", opts)
	unmap("n", "<C-S-=>", opts)
	unmap("n", "<leader>lk", opts)
	unmap("i", "<C-h>", opts)
	unmap("n", "<leader>ltd", opts)
	unmap("n", "<leader>lrn", opts)
	unmap("n", "<leader>lca", opts)
	unmap("v", "<leader>lca", opts)
	unmap("n", "<leader>lf", opts)
	unmap("n", "<leader>wa", opts)
	unmap("n", "<leader>wr", opts)
	unmap("n", "<leader>wl", opts)
	unmap("n", "<leader>lo", opts)
	unmap("n", "<leader>l<up>", opts)
	unmap("n", "<leader>l<down>", opts)
	unmap("n", "<leader>lq", opts)
end

return M
