return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "frappe",
            transparent_background = true,
            show_end_of_buffer = true,
            default_integrations = true,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.25,
            },
            integrations = {
                telescope = {
                    enabled = true,
                }
            },
            -- TODO: integrations: cmp, lualine, indent-blankline, nvim-notify,
            -- whichkey, mason, rainbow-delimeters
        },
        init = function()
            -- vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        priority = 1000,
        opts = {
            filter = "spectrum",
            transparent_background = false,
            background_clear = {
                "float_win",
            },
            -- TODO: integrations: cmp, lualine, indent-blankline, nvim-notify,
            -- whichkey, mason, rainbow-delimeters
        },
        init = function()
            vim.cmd.colorscheme "monokai-pro"
        end,
    },
}
