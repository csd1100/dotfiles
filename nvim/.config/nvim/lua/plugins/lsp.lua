return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
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
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
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
}
