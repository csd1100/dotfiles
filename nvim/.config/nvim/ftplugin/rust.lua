local lsp_keymaps = require("config.lsp-keymaps")
local map = require("config.keymap-utils").map
local _, modes_module = pcall(require, "modes")

modes_module.create_if_not_present(
    "Rust",
    function() end,
    function() end,
    "{}"
)
map("n", "<leader>rdis", function()
    require("modes").toggle_mode(
        "Rust",
        { buffer = vim.api.nvim_get_current_buf() }
    )
end, { desc = "Toggle Rust LSP for Current Buffer" })
modes_module.add_maps("Rust", lsp_keymaps.get_lsp_maps())
modes_module.add_maps("Rust", lsp_keymaps.get_rustacean_maps())
modes_module.enable_mode("Rust", { buffer = vim.api.nvim_get_current_buf() })
