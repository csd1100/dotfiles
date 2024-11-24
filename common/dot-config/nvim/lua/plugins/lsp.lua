return {
    -- Package Manager
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {
            ui = {
                border = ui_borders,
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v4.x',
                cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
                event = { 'BufReadPre', 'BufNewFile' },
            },
            { 'csd1100/modes.nvim' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            local modes = require('modes')
            modes.create_if_not_present(
                'LSP',
                function() end,
                function() end,
                '{}'
            )
            local maps = {
                ['n'] = {
                    ['K'] = {
                        ['rhs'] = function()
                            vim.lsp.buf.hover({ border = ui_borders })
                        end,
                        ['opts'] = { desc = 'Hover Info' },
                    },
                    ['gd'] = {
                        ['rhs'] = vim.lsp.buf.definition,
                        ['opts'] = { desc = 'Go To Definition' },
                    },
                    ['gD'] = {
                        ['rhs'] = vim.lsp.buf.declaration,
                        ['opts'] = { desc = 'Go To Declaration' },
                    },
                    ['gi'] = {
                        ['rhs'] = vim.lsp.buf.implementation,
                        ['opts'] = { desc = 'Go To Implementation' },
                    },
                    ['go'] = {
                        ['rhs'] = vim.lsp.buf.type_definition,
                        ['opts'] = { desc = 'Go To Type Definition' },
                    },
                    ['gr'] = {
                        ['rhs'] = vim.lsp.buf.references,
                        ['opts'] = { desc = 'Go To References' },
                    },
                    ['gs'] = {
                        ['rhs'] = function()
                            vim.lsp.buf.signature_help({ border = ui_borders })
                        end,
                        ['opts'] = { desc = 'Go To Signature Help' },
                    },
                    ['grn'] = {
                        ['rhs'] = vim.lsp.buf.rename,
                        ['opts'] = { desc = 'Rename' },
                    },
                    -- TODO: use https://lsp-zero.netlify.app/docs/reference/lua-api.html#format-mapping-key-opts
                    -- if necessary
                    ['<leader>lf'] = {
                        ['rhs'] = function()
                            vim.lsp.buf.format({ async = true })
                        end,
                        ['opts'] = { desc = 'Format' },
                    },
                    ['<leader>lca'] = {
                        ['rhs'] = vim.lsp.buf.code_action,
                        ['opts'] = { desc = 'Code Actions' },
                    },
                },
                ['x'] = {
                    -- TODO: use https://lsp-zero.netlify.app/docs/reference/lua-api.html#format-mapping-key-opts
                    -- if necessary
                    ['<leader>lf'] = {
                        ['rhs'] = function()
                            vim.lsp.buf.format({ async = true })
                        end,
                        ['opts'] = { desc = 'Format Selection' },
                    },
                },
            }
            modes.add_maps('LSP', maps)

            local lsp_attach = function(client, bufnr)
                modes.enable_mode('LSP', { buffer = bufnr })
                lsp_zero.highlight_symbol(client, bufnr)
            end

            lsp_zero.extend_lspconfig({
                lsp_attach = lsp_attach,
                sign_text = {
                    error = '✘',
                    warn = '▲',
                    hint = '⚑',
                    info = 'i',
                },
            })

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    lua_ls = lsp_zero.noop,
                },
            })

            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
}
