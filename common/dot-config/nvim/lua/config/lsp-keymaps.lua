local M = {}

function M.get_lsp_maps()
    return {
        ["n"] = {
            ["<leader>i"] = {
                ["rhs"] = function()
                    vim.lsp.buf.hover()
                end,
                ["opts"] = { desc = "Hover Info" },
            },
            ["gd"] = {
                ["rhs"] = function()
                    vim.lsp.buf.definition()
                end,
                ["opts"] = { desc = "Definition" },
            },
            ["gD"] = {
                ["rhs"] = function()
                    vim.lsp.buf.declaration()
                end,
                ["opts"] = { desc = "Declaration" },
            },
            ["go"] = {
                ["rhs"] = function()
                    vim.lsp.buf.type_definition()
                end,
                ["opts"] = { desc = "Type Definition" },
            },
            ["gr"] = {
                ["rhs"] = function()
                    vim.lsp.buf.references()
                end,
                ["opts"] = { desc = "References" },
            },
            ["gs"] = {
                ["rhs"] = function()
                    vim.lsp.buf.signature_help()
                end,
                ["opts"] = { desc = "Signature Help" },
            },
            ["<leader>lrn"] = {
                ["rhs"] = function()
                    vim.lsp.buf.rename()
                end,
                ["opts"] = { desc = "Rename" },
            },
            ["<leader>lca"] = {
                ["rhs"] = function()
                    vim.lsp.buf.code_action()
                end,
                ["opts"] = { desc = "Code Actions" },
            },
            ["<leader>lf"] = {
                ["rhs"] = function()
                    vim.lsp.buf.format()
                end,
                ["opts"] = { desc = "Format File" },
            },
            ["<leader>ld"] = {
                ["rhs"] = function()
                    vim.diagnostic.open_float()
                end,
                ["opts"] = { desc = "Open Diagnostics" },
            },
            ["<leader>lq"] = {
                ["rhs"] = function()
                    local trouble = if_successful("trouble")
                    if trouble ~= nil then
                        trouble.toggle()
                    else
                        vim.diagnostic.setloclist()
                    end
                end,
                ["opts"] = { desc = "Open Diagnostics" },
            },
            ["<leader>[d"] = {
                ["rhs"] = function()
                    vim.diagnostic.goto_prev()
                end,
                ["opts"] = { desc = "Previous Diagnostic" },
            },
            ["<leader>d]"] = {
                ["rhs"] = function()
                    vim.diagnostic.goto_next()
                end,
                ["opts"] = { desc = "Next Diagnostic" },
            },
            ["<leader>rb"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Extract Block")
                end,
                ["opts"] = { desc = "Extract Block" },
            },
            ["<leader>ri"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Inline Variable")
                end,
                ["opts"] = { desc = "Inline Variable" },
            },
            ["<leader>rbf"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                ["opts"] = { desc = "Extract Block To File" },
            },
            ["<C-g>"] = {
                ["rhs"] = function()
                    require("telescope.builtin").lsp_document_symbols()
                end,
                ["opts"] = { desc = "All Symbols Telescope" },
            },
            ["<C-i>"] = {
                ["rhs"] = function()
                    require("telescope.builtin").lsp_implementations()
                end,
                ["opts"] = { desc = "Implementation Telescope" },
            },
            ["<C-S-u>"] = {
                ["rhs"] = function()
                    require("telescope.builtin").lsp_references()
                end,
                ["opts"] = { desc = "References Telescope" },
            },
            ["<C-S-->"] = {
                ["rhs"] = function()
                    require("telescope.builtin").lsp_incoming_calls()
                end,
                ["opts"] = { desc = "Incoming Calls Telescope" },
            },
            ["<C-S-=>"] = {
                ["rhs"] = function()
                    require("telescope.builtin").lsp_outgoing_calls()
                end,
                ["opts"] = { desc = "Outgoing Calls Telescope" },
            },
        },
        ["i"] = {
            ["<C-k>"] = {
                ["rhs"] = function()
                    vim.lsp.buf.signature_help()
                end,
                ["opts"] = { desc = "Signature Help" },
            },
        },
        ["v"] = {
            ["<leader>lca"] = {
                ["rhs"] = function()
                    vim.lsp.buf.code_action()
                end,
                ["opts"] = { desc = "Code Actions" },
            },
            ["<leader>lf"] = {
                ["rhs"] = vim.lsp.buf.format,
                ["opts"] = { desc = "Format Selection" },
            },
            ["<leader>re"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Extract Function")
                end,
                ["opts"] = { desc = "Extract Function" },
            },
            ["<leader>rf"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                ["opts"] = { desc = "Extract Function To File" },
            },
            ["<leader>rv"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Extract Variable")
                end,
                ["opts"] = { desc = "Extract Variable" },
            },
            ["<leader>ri"] = {
                ["rhs"] = function()
                    require("refactoring").refactor("Inline Variable")
                end,
                ["opts"] = { desc = "Inline Variable" },
            },
        },
    }
end

M.get_rustacean_maps = function()
    return {
        ["n"] = {
            ["<leader>rca"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("codeAction")
                end,
                ["opts"] = { desc = "Rust Code Actions" },
            },
            ["<leader>rd"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp({ "debuggables" })
                end,
                ["opts"] = { desc = "Rust Debug Menu" },
            },
            ["<leader>rr"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp({ "runnables" })
                end,
                ["opts"] = { desc = "Rust Run Menu" },
            },
            ["<leader>gm"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("expandMacro")
                end,
                ["opts"] = { desc = "Rust Expand Macro" },
            },
            ["<leader>rbm"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("rebuildProcMacros")
                end,
                ["opts"] = { desc = "Rust Rebuild Proc Macro" },
            },

            ["<leader>J"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("joinLines")
                end,
                ["opts"] = { desc = "Rust Join Lines" },
            },
            ["<leader>rha"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp({ "hover", "actions" })
                end,
                ["opts"] = { desc = "Rust Hover Actions" },
            },
            ["<leader>rc"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("openCargo")
                end,
                ["opts"] = { desc = "Rust Open Cargo.toml" },
            },
            ["<leader>ro"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("parentModule")
                end,
                ["opts"] = { desc = "Rust Open Parent Module" },
            },
            ["<leader>rk"] = {
                ["rhs"] = function()
                    vim.cmd.RustLsp("flyCheck")
                end,
                ["opts"] = { desc = "Rust Run cargo check" },
            },
        },
        ["v"] = {},
    }
end

return M
