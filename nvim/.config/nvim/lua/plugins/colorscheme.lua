vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

return {
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
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "monokai-pro",
        config = function()
            require("monokai-pro").setup({
                filter = "spectrum",
                plugins = {
                    indent_blankline = {
                        context_highlight = "pro", -- default | pro
                        context_start_underline = false,
                    },
                },
                override = function()
                    return {
                        NonText = { fg = "#8F908A" },
                    }
                end,
            })
            vim.cmd.colorscheme("monokai-pro")
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                color_overrides = {
                    mocha = {},
                },
            })
            -- vim.cmd.colorscheme("catppuccin")
        end,
    },
}
