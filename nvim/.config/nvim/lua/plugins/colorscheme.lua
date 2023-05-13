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
                    vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
                    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#080808" })
                end,
                group = custom_highlight,
            })
            -- vim.cmd.colorscheme("moonfly")
        end,
    },
    {
        "sonph/onehalf",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            -- vim.cmd.colorscheme("onehalfdark")
        end,
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            vim.g.sonokai_diagnostic_text_highlight = 1
            vim.g.sonokai_better_performance = 1
            vim.cmd.colorscheme("sonokai")
        end,
    },
    {
        "casonadams/walh",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.g.sonokai_diagnostic_text_highlight = 1
            vim.g.sonokai_better_performance = 1
            vim.opt.termguicolors = false
            -- vim.cmd.colorscheme("walh-default")
        end,
    },
}
