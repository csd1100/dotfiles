vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
    {
        "rafi/awesome-vim-colorschemes",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            -- vim.cmd.colorscheme("deus")
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        opts = {
            style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            code_style = {
                keywords = "italic",
            },
        },
        config = function(_, opts)
            require("onedark").setup(opts)
            -- vim.cmd.colorscheme("onedark")
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
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
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
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
