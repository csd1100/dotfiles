vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.moonflyWinSeparator = 2
            vim.g.moonflyUnderlineMatchParen = true
            local custom_highlight =
                vim.api.nvim_create_augroup("CustomHighlight", {})
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "moonfly",
                callback = function()
                    vim.api.nvim_set_hl(0, "Normal", { bg = "#1D1D1D" })
                end,
                group = custom_highlight,
            })
            vim.cmd.colorscheme("moonfly")
        end,
    },
    {
        "sonph/onehalf",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            -- vim.cmd.colorscheme("onehalfdark")
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require("onedark").setup({
                style = "warm",
            })
            -- require("onedark").load()
        end,
    },
}
