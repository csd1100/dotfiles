return {
    {
        'nkakouros-original/numbers.nvim',
        event = 'InsertEnter',
        config = true,
    },
    {
        'thirtythreeforty/lessspace.vim',
        event = 'InsertEnter',
        init = function()
            vim.g.lessspace_blacklist = { 'markdown' }
        end,
    },
    {
        'numToStr/Comment.nvim',
        keys = { 'gcc' },
        opts = {
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'css',
                'csv',
                'fish',
                'html',
                'javascript',
                'json',
                'lua',
                'markdown',
                'toml',
                'vim',
                'vimdoc',
                'yaml',
            },
            indent = { enable = true },
            highlight = {
                enable = true,
                -- to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats =
                        pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_decremental = '<C-S-Space>',
                },
            },
            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['ap'] = {
                            query = '@parameter.outer',
                            desc = 'Select outer part of a parameter',
                        },
                        ['ip'] = {
                            query = '@parameter.inner',
                            desc = 'Select inner part of a parameter',
                        },
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'Select outer part of a function',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'Select inner part of a function',
                        },
                        ['ac'] = {
                            query = '@class.outer',
                            desc = 'Select outer part of a class region',
                        },
                        ['ic'] = {
                            query = '@class.inner',
                            desc = 'Select inner part of a class region',
                        },
                        -- You can also use captures from other query groups like `locals.scm`
                        ['as'] = {
                            query = '@local.scope',
                            query_group = 'locals',
                            desc = 'Select language scope',
                        },
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = true,
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { max_lines = 2 },
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
}
