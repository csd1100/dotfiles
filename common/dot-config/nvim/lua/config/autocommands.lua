local ft_autocommands = vim.api.nvim_create_augroup("FTAutoCommands", {})
vim.api.nvim_create_autocmd("FileType", {
    group = ft_autocommands,
    pattern = { "lua", "yaml", "markdown", "shell" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
