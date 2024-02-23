vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
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
            transparent_background = true,
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "moonfly",
        init = function()
            -- vim.cmd.colorscheme("moonfly")
        end,
    },
    {
        "Alexis12119/nightly.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "nightly",
        init = function()
            require("nightly").setup({
                transparent = false,
                styles = {
                    comments = { italic = true },
                    functions = { italic = true },
                    variables = { italic = false },
                    keywords = { italic = true },
                },
                highlights = {},
            })
            -- vim.cmd.colorscheme("nightly")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "kanagawa",
        opts = {
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus",
            },
        },
        init = function()
            -- vim.cmd.colorscheme("kanagawa")
        end,
    },
}
