local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local M = {}

function M.map_lsp_keys(bufnr)
    map("n", "<leader>i", function()
        vim.lsp.buf.hover()
    end, { buffer = bufnr, desc = "Hover Info (LSP)" })

    map("n", "gd", function()
        vim.lsp.buf.definition()
    end, { buffer = bufnr, desc = "Definition (LSP)" })
    map("n", "gD", function()
        vim.lsp.buf.declaration()
    end, { buffer = bufnr, desc = "Declaration (LSP)" })
    map("n", "gi", function()
        vim.lsp.buf.declaration()
    end, { buffer = bufnr, desc = "Implementation (LSP)" })
    map("n", "go", function()
        vim.lsp.buf.type_definition()
    end, { buffer = bufnr, desc = "Type Definition (LSP)" })
    map("n", "gr", function()
        vim.lsp.buf.references()
    end, { buffer = bufnr, desc = "References(LSP)" })
    map("n", "gs", function()
        vim.lsp.buf.signature_help()
    end, { buffer = bufnr, desc = "Signature Help (LSP)" })
    map("i", "<C-k>", function()
        vim.lsp.buf.signature_help()
    end, { buffer = bufnr, desc = "Signature Help (LSP)" })

    map("n", "<C-g>", function()
        vim.cmd([[Telescope lsp_document_symbols]])
    end, { buffer = bufnr, desc = "All symbols (LSP)" })
    map("n", "<C-i>", function()
        vim.cmd([[Telescope lsp_implementations]])
    end, { buffer = bufnr, desc = "Implementation (LSP)" })
    map("n", "<C-S-u>", function()
        vim.cmd([[Telescope lsp_references]])
    end, { buffer = bufnr, desc = "All Usages (LSP)" })
    map("n", "<C-S-->", function()
        vim.cmd([[Telescope lsp_incoming_calls]])
    end, { buffer = bufnr, desc = "Incoming Calls (LSP)" })
    map("n", "<C-S-=>", function()
        vim.cmd([[Telescope lsp_outgoing_calls]])
    end, { buffer = bufnr, desc = "Outgoing Calls (LSP)" })

    map("n", "<leader>lrn", function()
        vim.lsp.buf.rename()
    end, { buffer = bufnr, desc = "Rename (LSP)" })
    map("n", "<leader>lca", function()
        vim.lsp.buf.code_action()
    end, { buffer = bufnr, desc = "Code Actions (LSP)" })
    map("v", "<leader>lca", function()
        vim.lsp.buf.code_action()
    end, { buffer = bufnr, desc = "Code Actions (LSP)" })

    map("n", "<leader>lf", function()
        vim.lsp.buf.format()
    end, { buffer = bufnr, desc = "Format (LSP)" })

    map("n", "<leader>wa", function()
        vim.lsp.buf.add_workspace_folder()
    end, { buffer = bufnr, desc = "Add Workspace Folder (LSP)" })
    map("n", "<leader>wr", function()
        vim.lsp.buf.remove_workspace_folder()
    end, { buffer = bufnr, desc = "Remove Workspace Folder (LSP)" })
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = "List Workspace Folders (LSP)" })

    map("n", "gl", function()
        vim.diagnostic.open_float()
    end, { buffer = bufnr, desc = "Open LSP Diagnostics" })
    map("n", "[d", function()
        vim.diagnostic.goto_prev()
    end, { buffer = bufnr, desc = "Go To Previous Diagnostics" })
    map("n", "]d", function()
        vim.diagnostic.goto_next()
    end, { buffer = bufnr, desc = "Go To Next Diagnostics" })
    map("n", "<leader>lq", function()
        vim.diagnostic.setloclist()
    end, { buffer = bufnr, desc = "LSP Diagnostics List" })

    -- Remaps for the refactoring operations currently offered by the plugin
    map("v", "<leader>re", function()
        require("refactoring").refactor("Extract Function")
    end, { buffer = bufnr, desc = "Extract Function (Refactoring)" })
    map("v", "<leader>rf", function()
        require("refactoring").refactor("Extract Function To File")
    end, { buffer = bufnr, desc = "Extract Function To File (Refactoring)" })
    map("v", "<leader>rv", function()
        require("refactoring").refactor("Extract Variable")
    end, { buffer = bufnr, desc = "Extract Variable (Refactoring)" })
    map("v", "<leader>ri", function()
        require("refactoring").refactor("Inline Variable")
    end, { buffer = bufnr, desc = "Inline Variable (Refactoring)" })

    -- Extract block doesn't need visual mode
    map("n", "<leader>rb", function()
        require("refactoring").refactor("Extract Block")
    end, { buffer = bufnr, desc = "Extract Block (Refactoring)" })
    map("n", "<leader>rbf", function()
        require("refactoring").refactor("Extract Block To File")
    end, { buffer = bufnr, desc = "Extract Block To File (Refactoring)" })

    -- Inline variable can also pick up the identifier currently under the cursor without visual mode
    map("n", "<leader>ri", function()
        require("refactoring").refactor("Inline Variable")
    end, { buffer = bufnr, desc = "Inline Variable (Refactoring)" })
end

function M.unmap_lsp_keys(bufnr)
    local opts = {
        buffer = bufnr,
    }
    unmap("n", "<leader>i", opts)
    unmap("n", "<C-g>", opts)
    unmap("n", "<C-i>", opts)
    unmap("n", "gd", opts)
    unmap("n", "gD", opts)
    unmap("n", "gi", opts)
    unmap("n", "go", opts)
    unmap("n", "gr", opts)
    unmap("n", "<C-S-u>", opts)
    unmap("n", "<C-S-->", opts)
    unmap("n", "<C-S-=>", opts)
    unmap("n", "gs", opts)
    unmap("i", "<C-k>", opts)
    unmap("n", "<leader>lrn", opts)
    unmap("n", "<leader>lca", opts)
    unmap("v", "<leader>lca", opts)
    unmap("n", "<leader>lf", opts)
    unmap("n", "<leader>wa", opts)
    unmap("n", "<leader>wr", opts)
    unmap("n", "<leader>wl", opts)
    unmap("n", "gl", opts)
    unmap("n", "[d", opts)
    unmap("n", "]d", opts)
    unmap("n", "<leader>lq", opts)
    unmap("v", "<leader>re", opts)
    unmap("v", "<leader>rf", opts)
    unmap("v", "<leader>rv", opts)
    unmap("v", "<leader>ri", opts)
    unmap("n", "<leader>rb", opts)
    unmap("n", "<leader>rbf", opts)
    unmap("n", "<leader>ri", opts)
end

M.map_jdtls_keys = function(bufnr)
    M.map_lsp_keys(bufnr)
    map(
        "n",
        "<leader>li",
        ':lua require("jdtls").organize_imports()<CR>',
        { buffer = bufnr, desc = "Organize Imports (LSP:Java)" }
    )

    map(
        "n",
        "<leader>lev",
        ':lua require("jdtls").extract_variable()<CR>',
        { buffer = bufnr, desc = "Extract Variable (LSP:Java)" }
    )
    map(
        "v",
        "<leader>lev",
        ':lua require("jdtls").extract_variable(true)<CR>',
        { buffer = bufnr, desc = "Extract Variable (LSP:Java)" }
    )

    map(
        "n",
        "<leader>lec",
        ':lua require("jdtls").extract_constant()<CR>',
        { buffer = bufnr, desc = "Extract Constant (LSP:Java)" }
    )
    map(
        "v",
        "<leader>lec",
        ':lua require("jdtls").extract_constant(true)<CR>',
        { buffer = bufnr, desc = "Extract Constant (LSP:Java)" }
    )

    map(
        "v",
        "<leader>lem",
        ':lua require("jdtls").extract_method(true)<CR>',
        { buffer = bufnr, desc = "Extract Method (LSP:Java)" }
    )

    map(
        "n",
        "<leader>ltc",
        ':lua require("jdtls").test_class()<CR>',
        { buffer = bufnr, desc = "Test Class (LSP:Java)" }
    )
    map(
        "n",
        "<leader>ltm",
        ':lua require("jdtls").test_nearest_method()<CR>',
        { buffer = bufnr, desc = "Test Nearest (LSP:Java)" }
    )
end

M.unmap_jdtls_keys = function(bufnr)
    M.unmap_lsp_keys(bufnr)
    local options = {
        buffer = bufnr,
    }
    unmap("n", "<leader>li", options)
    unmap("n", "<leader>lev", options)
    unmap("v", "<leader>lev", options)
    unmap("n", "<leader>lec", options)
    unmap("v", "<leader>lec", options)
    unmap("n", "<leader>lem", options)
    unmap("n", "<leader>ltc", options)
    unmap("n", "<leader>ltm", options)
end

return M
