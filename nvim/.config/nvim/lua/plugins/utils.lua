local map = require("config.keymap-utils").map
return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = true,
    },
    {
        "theprimeagen/harpoon",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            defaults = {
                path_display = {
                    shorten = { len = 2, exclude = { -1 } },
                },
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        height = 0.9,
                        preview_cutoff = 120,
                        prompt_position = "bottom",
                        width = 0.8,
                        preview_width = 75,
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "-u",
                    "--ignore",
                    "--hidden",
                    "--no-ignore-vcs",
                    "-g",
                    "!{.git,node_modules}",
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
                        "!{.git,node_modules}",
                    },
                    prompt_prefix = "🔍",
                },
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                },
            },
        },
        config = function(plugin, opts)
            opts.extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = require(
                                "telescope-live-grep-args.actions"
                            ).quote_prompt(),
                            ["<C-i>"] = require(
                                "telescope-live-grep-args.actions"
                            ).quote_prompt({
                                postfix = " --iglob ",
                            }),
                        },
                    },
                    theme = "dropdown",
                },
            }
            require("telescope").setup(opts)
            require("telescope").load_extension("live_grep_args")
            require("telescope").load_extension("harpoon")
        end,
    },
    {
        "csd1100/modes.nvim",
        -- dev = true,
        config = true,
    },
    {
        "mbbill/undotree",
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").register({
                [":"] = "which_key_ignore",
            })
        end,
    },
    {
        "nkakouros-original/numbers.nvim",
        event = "InsertEnter",
        config = true,
    },
    {
        "mcauley-penney/tidy.nvim",
        event = "BufWritePre",
        config = true,
    },
    {
        "jghauser/mkdir.nvim",
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            numhl = true,
            signs = {
                add = { text = " " },
                change = { text = " " },
                delete = { text = " " },
            },
        },
        config = true,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPre",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },
    {
        "ahmedkhalf/project.nvim",
        main = "project_nvim",
        opts = {
            manual_mode = false,
            detection_methods = { "pattern" },
            patterns = {
                ".git",
                "_darcs",
                ".hg",
                ".bzr",
                ".svn",
                "Makefile",
                "package.json",
                "build.gradle",
                "pom.xml",
                "lazy-lock.json",
            },
            ignore_lsp = {},
            -- Don't calculate root dir on specific directories
            -- Ex: { "~/.cargo/*", ... }
            exclude_dirs = { "node_modules/**" },
            show_hidden = true,
            silent_chdir = false,
            scope_chdir = "tab",
            datapath = vim.fn.stdpath("data"),
        },
        config = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup()
        end,
    },
}
