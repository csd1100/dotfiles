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
                gitsigns = true,
                which_key = true,
                rainbow_delimiters = false,
                notify = true,
                fidget = true,
                mason = true,
                cmp = true,
                lsp_trouble = true,
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
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        build = ':GithubThemeCompile',
        priority = 1000,
        opts = {
            options = {
                terminal_colors = true,
                dim_inactive = true,
                styles = {
                    comments = 'italic',
                    keywords = 'bold',
                    types = 'italic,bold',
                }
            },
        },
        init = function()
            -- vim.cmd.colorscheme('github_dark')
        end,
    },
}
