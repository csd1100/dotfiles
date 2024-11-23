local ku = require("config.keymap-utils")

return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        opts = {
            defaults = {
                borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                path_display = {
                    shorten = { len = 2, exclude = { -1, 1 } },
                },
            },
            pickers = {
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--ignore",
                        "--hidden",
                        "--no-ignore-vcs",
                        "-g",
                        "!{.git,node_modules,target,out,build}",
                    },
                },
                buffers = {
                    ignore_current_buffer = true,
                    sort_mru = true,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                },
            },
        },
        config = function(_, opts)
            local lga_actions = require("telescope-live-grep-args.actions")

            opts.extensions.live_grep_args = {
                auto_quoting = true,
                mappings = {
                    i = {
                        ["<C-k>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({
                            postfix = " --iglob ",
                        }),
                    },
                },
            }

            local telescope = require('telescope')
            telescope.setup(opts)

            local builtin = require('telescope.builtin')
            ku.map('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
            ku.map('n', '<leader>ff', telescope.extensions.live_grep_args.live_grep_args, { desc = 'Telescope live grep' })
            ku.map('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume' })
            ku.map('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
            ku.map('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
            ku.map('n', '<leader>cs', builtin.colorscheme, { desc = 'Telescope colorschemes' })

            telescope.load_extension('fzf')
            telescope.load_extension('live_grep_args')
        end,
    },
    {
        'mbbill/undotree',
        keys = {
            {'<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle UndoTree'}
        },
    },
}
