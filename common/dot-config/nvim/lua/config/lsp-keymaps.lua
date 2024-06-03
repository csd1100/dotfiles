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

M.get_jdtls_maps = function()
    return {
        ["n"] = {
            ["<leader>li"] = {
                ["rhs"] = function()
                    require("jdtls").organize_imports()
                end,
                ["opts"] = { desc = "Organize Imports" },
            },

            ["<leader>rv"] = {
                ["rhs"] = function()
                    require("jdtls").extract_variable()
                end,
                ["opts"] = { desc = "Extract Variable" },
            },
            ["<leader>rc"] = {
                ["rhs"] = function()
                    require("jdtls").extract_constant()
                end,
                ["opts"] = { desc = "Extract Constant" },
            },
            ["<leader>tn"] = {
                ["rhs"] = function()
                    require("jdtls").test_nearest_method()
                end,
                ["opts"] = { desc = "Run Nearest Test" },
            },
            ["<leader>tc"] = {
                ["rhs"] = function()
                    require("jdtls").test_class()
                end,
                ["opts"] = { desc = "Run Current File" },
            },
        },
        ["v"] = {
            ["<leader>rv"] = {
                ["rhs"] = function()
                    require("jdtls").extract_variable()
                end,
                ["opts"] = { desc = "Extract Variable" },
            },
            ["<leader>rc"] = {
                ["rhs"] = function()
                    require("jdtls").extract_constant(true)
                end,
                ["opts"] = { desc = "Extract Constant" },
            },
            ["<leader>rm"] = {
                ["rhs"] = function()
                    require("jdtls").extract_method(true)
                end,
                ["opts"] = { desc = "Extract Method" },
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

M.get_crates_maps = function()
    local crates = require("crates")

    return {
        ["n"] = {
            ["<leader>ct"] = {
                ["rhs"] = function()
                    crates.toggle()
                end,
                ["opts"] = { desc = "Toggle Crates" },
            },
            ["<leader>cr"] = {
                ["rhs"] = function()
                    crates.reload()
                end,
                ["opts"] = { desc = "Reload Crates Cache" },
            },
            ["<leader>cv"] = {
                ["rhs"] = function()
                    crates.show_versions_popup()
                end,
                ["opts"] = { desc = "Show Crates Versions Popups" },
            },
            ["<leader>cf"] = {
                ["rhs"] = function()
                    crates.show_features_popup()
                end,
                ["opts"] = { desc = "Show Crates Features Popups" },
            },
            ["<leader>cd"] = {
                ["rhs"] = function()
                    crates.show_dependencies_popup()
                end,
                ["opts"] = { desc = "Show Crates Dependencies Popups" },
            },
            ["<leader>cu"] = {
                ["rhs"] = function()
                    crates.update_crate()
                end,
                ["opts"] = { desc = "Update Crate Under Cursor" },
            },
            ["<leader>ca"] = {
                ["rhs"] = function()
                    crates.update_all_crates()
                end,
                ["opts"] = { desc = "Update All Crates" },
            },
            ["<leader>cU"] = {
                ["rhs"] = function()
                    crates.upgrade_crate()
                end,
                ["opts"] = { desc = "Upgrade Crate Under Cursor" },
            },
            ["<leader>cA"] = {
                ["rhs"] = function()
                    crates.upgrade_crates()
                end,
                ["opts"] = { desc = "Upgrade All Crates" },
            },
            ["<leader>cx"] = {
                ["rhs"] = function()
                    crates.expand_plain_crate_to_inline_table()
                end,
                ["opts"] = { desc = "Expand Plain Crate To Inline Table" },
            },
            ["<leader>cX"] = {
                ["rhs"] = function()
                    crates.extract_crate_into_table()
                end,
                ["opts"] = { desc = "Extract Crate Into Table" },
            },
            ["<leader>cH"] = {
                ["rhs"] = function()
                    crates.open_homepage()
                end,
                ["opts"] = { desc = "Open Crates Homepage" },
            },
            ["<leader>cR"] = {
                ["rhs"] = function()
                    crates.open_repository()
                end,
                ["opts"] = { desc = "Open Crates Repository" },
            },
            ["<leader>cD"] = {
                ["rhs"] = function()
                    crates.open_documentation()
                end,
                ["opts"] = { desc = "Open Crates Documentation" },
            },
            ["<leader>cC"] = {
                ["rhs"] = function()
                    crates.open_crates_io()
                end,
                ["opts"] = { desc = "Open crates.io" },
            },
        },
        ["v"] = {
            ["<leader>cu"] = {
                ["rhs"] = function()
                    crates.update_crates()
                end,
                ["opts"] = { desc = "Update Selected Crates" },
            },
            ["<leader>cU"] = {
                ["rhs"] = function()
                    crates.upgrade_crates()
                end,
                ["opts"] = { desc = "Upgrade Selected Crates" },
            },
        },
    }
end

return M
