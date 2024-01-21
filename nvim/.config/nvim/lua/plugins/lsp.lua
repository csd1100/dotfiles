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
        "nvimtools/none-ls.nvim",
        ft = {
            "bash",
            "javascript",
            "typescript",
            "lua",
            "sh",
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
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
    },
    {
        "mfussenegger/nvim-ansible",
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
        "mrcjkb/rustaceanvim",
        version = "^3",
        ft = { "rust" },
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
        "elkowar/yuck.vim",
        ft = "yuck",
    },
}
