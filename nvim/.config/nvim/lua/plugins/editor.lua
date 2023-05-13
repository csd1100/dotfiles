return {
    {
        "terrortylor/nvim-comment",
        main = "nvim_comment",
        config = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ft = {
            "sh",
            "bash",
            "json",
            "markdown",
            "yaml",
            "lua",
            "java",
            "javascript",
            "typescript",
            "rust",
            "go",
        },
        opts = {
            ensure_installed = {
                "bash",
                "json",
                "markdown",
                "yaml",
                "lua",
                "java",
                "javascript",
                "typescript",
                "rust",
                "go",
                "regex",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<c-backspace>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
            },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            }
        },
        config = function(plugin, opts)
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            require("nvim-treesitter.configs").setup(opts)
            vim.opt.foldenable = false
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        ft = {
            "sh",
            "bash",
            "json",
            "markdown",
            "yaml",
            "lua",
            "java",
            "javascript",
            "typescript",
            "rust",
            "go",
        },
        dependencies = "nvim-treesitter",
    },
    {
        'nvim-treesitter/playground',
        ft = {
            "sh",
            "bash",
            "json",
            "markdown",
            "yaml",
            "lua",
            "java",
            "javascript",
            "typescript",
            "rust",
            "go",
        },
        dependencies = "nvim-treesitter",
    },
}
