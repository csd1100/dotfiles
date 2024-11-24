return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavour = 'frappe',
            transparent_background = true,
            show_end_of_buffer = true,
            default_integrations = true,
            integrations = {
                telescope = {
                    enabled = true,
                },
                which_key = true,
                rainbow_delimiters = false,
                notify = true,
                mason = true,
                cmp = true,
            },
        },
        init = function()
            vim.cmd.colorscheme('catppuccin')
        end,
    },
    {
        'loctvl842/monokai-pro.nvim',
        priority = 1000,
        opts = {
            filter = 'spectrum',
            transparent_background = false,
            background_clear = {
                'float_win',
                'which-key',
                'notify',
            },
        },
        init = function()
            -- vim.cmd.colorscheme('monokai-pro')
        end,
    },
}
