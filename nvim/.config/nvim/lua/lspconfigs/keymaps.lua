local keymapUtils = require("basic.keymaps-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local M = {}

function M.map_lsp_keys(bufnr)
	map("n", "<leader>i", ":lua vim.lsp.buf.hover()<CR>", { buffer = bufnr, desc = "Hover Info (LSP)" })
	map("n", "<C-g>", ":Telescope lsp_document_symbols<CR>", { buffer = bufnr, desc = "All symbols (LSP)" })
	map("n", "<C-i>", ":Telescope lsp_implementations<CR>", { buffer = bufnr, desc = "Implementation (LSP)" })
	map("n", "<C-d>", ":lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Definition (LSP)" })
	map("n", "<C-S-u>", ":Telescope lsp_references<CR>", { buffer = bufnr, desc = "All Usages (LSP)" })
	map("n", "<C-S-->", ":Telescope lsp_incoming_calls<CR>", { buffer = bufnr, desc = "Incoming Calls (LSP)" })
	map("n", "<C-S-=>", ":Telescope lsp_outgoing_calls<CR>", { buffer = bufnr, desc = "Outgoing Calls (LSP)" })
	map("n", "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr, desc = "Signature Help (LSP)" })
	map(
		"n",
		"<leader>ltd",
		":lua vim.lsp.buf.type_definition()<CR>",
		{ buffer = bufnr, desc = "Type Definition (LSP)" }
	)
	map("n", "<leader>lrn", ":lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, desc = "Rename (LSP)" })
	map("n", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc = "Code Actions (LSP)" })
	map("v", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc = "Code Actions (LSP)" })
	map("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", { buffer = bufnr, desc = "Format (LSP)" })

	map(
		"n",
		"<leader>wa",
		":lua vim.lsp.buf.add_workspace_folder()<CR>",
		{ buffer = bufnr, desc = "Add Workspace Folder (LSP)" }
	)
	map(
		"n",
		"<leader>wr",
		":lua vim.lsp.buf.remove_workspace_folder()<CR>",
		{ buffer = bufnr, desc = "Remove Workspace Folder (LSP)" }
	)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { buffer = bufnr, desc = "List Workspace Folders (LSP)" })

	map("n", "<leader>lo", ":lua vim.diagnostic.open_float()<CR>", { buffer = bufnr, desc = "Open LSP Diagnostics" })
	map(
		"n",
		"<leader>l<up>",
		":lua vim.diagnostic.goto_prev()<CR>",
		{ buffer = bufnr, desc = "Go To Previous Diagnostics" }
	)
	map(
		"n",
		"<leader>l<down>",
		":lua vim.diagnostic.goto_next()<CR>",
		{ buffer = bufnr, desc = "Go To Next Diagnostics" }
	)
	map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", { buffer = bufnr, desc = "LSP Diagnostics List" })
end

function M.unmap_lsp_keys(bufnr)
	local opts = {
		buffer = bufnr,
	}
	unmap("n", "<leader>i", opts)
	unmap("n", "<C-g>", opts)
	unmap("n", "<C-i>", opts)
	unmap("n", "<C-d>", opts)
	unmap("n", "<C-S-u>", opts)
	unmap("n", "<C-S-->", opts)
	unmap("n", "<C-S-=>", opts)
	unmap("n", "<leader>lk", opts)
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
