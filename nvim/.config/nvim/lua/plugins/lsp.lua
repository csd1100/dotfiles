return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-nvim-lsp-document-symbol" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    { name = "crates" },
                    { name = "vsnip" },
                    { name = "nvim_lsp_signature_help" },
                },
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = require("lspkind").cmp_format({
                        mode = "symbol",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                view = {
                    docs = {
                        auto_open = false,
                    },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),

                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<Up>"] = cmp.mapping.select_prev_item({
                        behavior = "select",
                    }),
                    ["<Down>"] = cmp.mapping.select_next_item({
                        behavior = "select",
                    }),
                    ["<Tab>"] = cmp.mapping.select_next_item({
                        behavior = "select",
                    }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({
                        behavior = "select",
                    }),
                    ["<C-p>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    ["<C-n>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                }),
            })
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "nvim_lsp_document_symbol" },
                    { name = "buffer" },
                },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "mfussenegger/nvim-jdtls",
                ft = "java",
            },
            {
                "mrcjkb/rustaceanvim",
                version = "^3",
                ft = { "rust" },
            },
            {
                "csd1100/modes.nvim",
                -- dev = true,
                config = true,
            },
        },
        config = function()
            local status, modes_module = pcall(require, "modes")
            local map = require("config.keymap-utils").map
            local lspMaps = require("config.lsp-keymaps")

            modes_module.create_if_not_present(
                "LSP",
                function() end,
                function() end,
                "{}"
            )
            modes_module.add_maps("LSP", lspMaps.get_lsp_maps())

            modes_module.create_if_not_present(
                "Rust",
                function() end,
                function() end,
                "{}"
            )
            modes_module.add_maps("Rust", lspMaps.get_rustacean_maps())

            -- LSP Setup
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                if status then
                    modes_module.enable_mode("LSP", { buffer = bufnr })

                    map("n", "<leader>ldis", function()
                        require("modes").toggle_mode(
                            "LSP",
                            { buffer = vim.api.nvim_get_current_buf() }
                        )
                    end, {
                        desc = "Toggle LSP for Current Buffer",
                    })
                else
                    lsp_zero.default_keymaps({ buffer = bufnr })
                end
            end)

            lsp_zero.set_server_config({
                capabilities = {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true,
                        },
                    },
                },
            })

            vim.g.rustaceanvim = {
                server = {
                    capabilities = lsp_zero.get_capabilities(),
                    on_attach = function(client, bufnr)
                        map("n", "<leader>rdis", function()
                            require("modes").toggle_mode(
                                "Rust",
                                { buffer = vim.api.nvim_get_current_buf() }
                            )
                        end, {
                            desc = "Toggle Rust LSP for Current Buffer",
                        })
                        modes_module.enable_mode("Rust", { buffer = bufnr })
                    end,
                },
            }

            require("config.jdtls")

            -- MASON Installation
            local ensure_installed = {
                "bashls",
                "lua_ls",
                "marksman",
                "rust_analyzer",
            }

            local mason_registry = require("mason-registry")

            local check_installed = {
                "tsserver",
                "gopls",
                "rust_analyzer",
                "jdtls",
            }

            local function is_tool_installed(lsp)
                local command
                if lsp == "tsserver" then
                    command = { "node", "--version" }
                elseif lsp == "gopls" then
                    command = { "go", "version" }
                elseif lsp == "rust_analyzer" then
                    command = { "rustc", " --version" }
                elseif lsp == "jdtls" then
                    command = { "java", "--version" }
                else
                    return nil
                end

                local status, _ = pcall(vim.system, command)
                return status
            end

            local function lsp_already_installed(lsp)
                if lsp == "tsserver" then
                    lsp = "typescript-language-server"
                elseif lsp == "rust_analyzer" then
                    lsp = "rust-analyzer"
                end
                local is_installed = mason_registry.is_installed(lsp)
                -- print(lsp .. ":" .. is_installed)
            end

            for _, lsp in ipairs(check_installed) do
                if
                    not lsp_already_installed(lsp)
                    and is_tool_installed(lsp)
                then
                    table.insert(ensure_installed, lsp)
                end
            end

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                    jdtls = lsp_zero.noop,
                    rust_analyzer = lsp_zero.noop,
                },
            })

            local tools_to_install = {
                "stylua",
                "eslint_d",
                "shfmt",
                "shellcheck",
                "prettier",
                "gomodifytags",
                "ansible-lint",
                "markdownlint",
                "java-test",
                "java-debug-adapter",
                "chrome-debug-adapter",
                "node-debug2-adapter",
            }

            local function mason_install_if_not(tool)
                if
                    not mason_registry.is_installed(tool)
                    and mason_registry.has_package(tool)
                then
                    local package = mason_registry.get_package(tool)
                    package:install()
                end
            end

            vim.tbl_map(mason_install_if_not, tools_to_install)
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        ft = {
            "bash",
            "javascript",
            "typescript",
            "lua",
            "sh",
            "markdown",
            "go",
        },
        config = function()
            local null_ls = require("null-ls")
            local opts = {
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.code_actions.refactoring,
                    null_ls.builtins.formatting.shfmt,
                    null_ls.builtins.code_actions.shellcheck,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.code_actions.gomodifytags,
                    null_ls.builtins.diagnostics.ansiblelint,
                    null_ls.builtins.diagnostics.deadnix,
                    null_ls.builtins.diagnostics.markdownlint,
                },
            }
            null_ls.setup(opts)
        end,
        dependencies = {
            {
                "ThePrimeagen/refactoring.nvim",
                config = true,
                ft = {
                    "javascript",
                    "typescript",
                    "lua",
                },
            },
        },
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        tag = "stable",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        },
        config = true,
    },
    {
        "folke/trouble.nvim",
        cmd = "LspStart",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "csd1100/csd-snips.nvim",
        -- dev = true,
        ft = {
            "java",
            "javascript",
            "typescript",
            "rust",
            "go",
        },
        config = function()
            require("config.keymaps").csd_snips()
        end,
    },
    {
        "mfussenegger/nvim-ansible",
        ft = "yaml",
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            require("config.keymaps").markdown_preview()
        end,
    },
    {
        "elkowar/yuck.vim",
        ft = "yuck",
    },
}
