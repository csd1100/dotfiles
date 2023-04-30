return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            -- snippets kind(function, string) icons --
            { "onsails/lspkind.nvim" },
            { "folke/neodev.nvim" },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {
            "bash",
            "javascript",
            "typescript",
            "lua",
        },
        config = function()
            local null_ls = require("null-ls")
            local opts = {
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.code_actions.refactoring,
                    null_ls.builtins.formatting.shfmt,
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
        "j-hui/fidget.nvim",
        config = true,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
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
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
    },
    {
        "saecki/crates.nvim",
        ft = "rust",
        tag = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
}
