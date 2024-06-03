local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
print(filename)
if filename == "Cargo.toml" then
    local lsp_keymaps = require("config.lsp-keymaps")
    local map = require("config.keymap-utils").map
    local _, modes_module = pcall(require, "modes")

    modes_module.create_if_not_present(
        "Cargo",
        function() end,
        function() end,
        "{󰏓}"
    )
    map("n", "<leader>ldc", function()
        require("modes").toggle_mode(
            "Cargo",
            { buffer = vim.api.nvim_get_current_buf() }
        )
    end, { desc = "Toggle LSP for Current Buffer" })
    modes_module.add_maps("Cargo", lsp_keymaps.get_crates_maps())
    modes_module.toggle_mode(
        "Cargo",
        { buffer = vim.api.nvim_get_current_buf() }
    )
end
