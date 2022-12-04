local status, packer = pcall(require, "packer")
if not status then
	vim.notify("failed to load packer", "error")
	return
end

-- packer config --
vim.cmd("autocmd BufWritePost plugin_specification.lua source <afile> | PackerSync")
return packer.startup(function()
	use({
		"wbthomason/packer.nvim",
	})

	-- fast loading plugins --
	use({
		"lewis6991/impatient.nvim",
	})

	-- lua utils --
	use({
		"nvim-lua/plenary.nvim",
	})

	-- fzf telescope --
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Sessions Management --
	use({
		"rmagatti/auto-session",
	})

	-- file tree --
	use({
		"kyazdani42/nvim-tree.lua",
	})

	-- which key --
	use({
		"folke/which-key.nvim",
	})

	-- project management --
	use({
		"ahmedkhalf/project.nvim",
	})

	-- dashboard --
	use({
		"glepnir/dashboard-nvim",
	})

	-- icons --
	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- sidebar --
	use({
		"sidebar-nvim/sidebar.nvim",
	})

	-- lua line --
	use({
		"nvim-lualine/lualine.nvim",
	})

	-- cursor line --
	use({
		"yamatsum/nvim-cursorline",
	})

	-- tab/buffer line --
	use({
		"akinsho/bufferline.nvim",
	})

	-- indent line --
	use({
		"lukas-reineke/indent-blankline.nvim",
	})

	-- git --
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- colorizer --
	use({
		"norcalli/nvim-colorizer.lua",
	})

	-- create dirs when saving if not present --
	use({
		"jghauser/mkdir.nvim",
	})

	-- clean trailing white-spaces --
	use({
		"mcauley-penney/tidy.nvim",
	})

	-- colorschemes --
	use({
		"sainnhe/sonokai",
	})

	use({
		"sainnhe/gruvbox-material",
	})

	use({
		"catppuccin/nvim",
	})
	-- disable relative numbers when in insert mode --
	use({
		"nkakouros-original/numbers.nvim",
	})

	-- treesitter syntax highlight --
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdateSync",
	})

	-- spell-check --
	use({
		"lewis6991/spellsitter.nvim",
	})

	-- regex explainer --
	use({
		"bennypowers/nvim-regexplainer",
	})
	use({
		"MunifTanjim/nui.nvim",
	})

	-- terminal --
	use({
		"akinsho/toggleterm.nvim",
	})

	-- markdown preview --
	use({
		"ellisonleao/glow.nvim",
		opt = true,
		ft = "markdown",
	})

	-- commentor --
	use({
		"terrortylor/nvim-comment",
	})

	-- lsp --
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"williamboman/mason.nvim",
	})
	use({
		"williamboman/mason-lspconfig.nvim",
	})

	-- Autocompletion plugin
	use({
		"hrsh7th/nvim-cmp",
	})

	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-nvim-lsp",
	})

	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-vsnip",
	})

	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-path",
	})

	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-buffer",
	})

	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-cmdline",
	})

	-- Snippets source for nvim-cmp
	use({
		"saadparwaiz1/cmp_luasnip",
	})

	-- Snippets plugin
	use({
		"L3MON4D3/LuaSnip",
	})

	-- null-ls --
	use({
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- debugger --
	use({
		"mfussenegger/nvim-dap",
	})

	-- debugger ui --
	use({
		"rcarriga/nvim-dap-ui",
	})

	-- rust --
	use({
		"simrat39/rust-tools.nvim",
	})

	-- rust --
	use({
		"Saecki/crates.nvim",
	})

	-- java --
	use({
		"mfussenegger/nvim-jdtls",
	})

	-- javascript/typescript --
	use({
		"jose-elias-alvarez/typescript.nvim",
	})

	-- testing plugin --
	use({
		"nvim-neotest/neotest",
		comment = "e0868ea9934e37be722b16bf5b8848baa918f433",
	})

	-- only for mocha
	use({
		"klen/nvim-test",
	})

	-- test: rust --
	use({
		"rouge8/neotest-rust",
		requires = "neotest",
	})

	-- test: plenary --
	use({
		"nvim-neotest/neotest-plenary",
		requires = "neotest",
	})

	-- refactoring --
	use({
		"ThePrimeagen/refactoring.nvim",
	})

	-- kitty conf --
	use({
		"fladson/vim-kitty",
	})

	use({
		"ThePrimeagen/vim-be-good",
	})

	use({
		"csd1100/modes.nvim",
	})
end)
