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
        branch = "harpoon2",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            require("config.keymaps").harpoon(harpoon)
        end,
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
                theme = "dropdown",
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
                    theme = "dropdown",
                },
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                    theme = "dropdown",
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
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("live_grep_args")
            telescope.load_extension("harpoon")
            require("config.keymaps").telescope(telescope)
        end,
    },
    {
        "mbbill/undotree",
        event = "BufReadPost",
        config = function()
            require("config.keymaps").undotree()
        end,
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
        event = "BufReadPost",
        opts = {
            filetype_exclude = { "markdown", "diff", "dashboard" },
        },
        config = true,
    },
    {
        "jghauser/mkdir.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        opts = {
            numhl = true,
            signs = {
                add = { text = " " },
                change = { text = " " },
                delete = { text = " " },
            },
        },
        config = function(_, opts)
            require("gitsigns").setup(opts)
            require("config.keymaps").gitsigns()
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPre",
        dependencies = "nvim-lua/plenary.nvim",
        config = function(plugin)
            local todo = require("todo-comments")
            require("config.keymaps").todo(todo)
        end,
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
        "akinsho/toggleterm.nvim",
        event = "BufReadPost",
        version = "*",
        opts = {
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            autochdir = true,
            persist_mode = true,
            direction = "float",
            float_opts = {
                -- border = "curved",
            },
        },
    },
}
