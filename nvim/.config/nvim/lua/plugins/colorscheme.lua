vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
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
            -- vim.cmd.colorscheme("monokai-pro")
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "catppuccin",
        opts = {
            flavour = "frappe",
            transparent_background = false,
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
