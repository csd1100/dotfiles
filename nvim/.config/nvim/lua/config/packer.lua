local fn = vim.fn

local function packer_startup()
	local status, packer = pcall(require, "packer")
	if not status then
		vim.notify("failed to load packer", "error")
		return
	end

	local packer_util = require("packer.util")
	local conf = {
		snapshot_path = vim.fn.stdpath("cache") .. "/packer.nvim/",
		display = {
			open_fn = function()
				return packer_util.float({
					border = "rounded",
				})
			end,
		},
		profile = {
			enable = true,
		},
	}
	packer.init(conf)

	vim.cmd("autocmd BufWritePost packer.lua source <afile> | PackerSync")

	return require("packer").startup(function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		use({
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},
		})
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ -- Additional text objects via treesitter
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
		})
		use("theprimeagen/harpoon")
		use("mbbill/undotree")
		use("tpope/vim-fugitive")
		use("lewis6991/gitsigns.nvim")
		use("folke/zen-mode.nvim")
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				{ "nvim-tree/nvim-web-devicons" },
			},
			tag = "nightly",
		})
		use("rmagatti/auto-session")
		use("ahmedkhalf/project.nvim")
		use("nvim-lualine/lualine.nvim")
		use("yamatsum/nvim-cursorline")
		use("lukas-reineke/indent-blankline.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("jghauser/mkdir.nvim")
		use("mcauley-penney/tidy.nvim")
		use("terrortylor/nvim-comment")
		use("csd1100/modes.nvim")
		use("folke/which-key.nvim")
		use("sainnhe/gruvbox-material")
		use({ "sonph/onehalf", rtp = "vim" })
		use("glepnir/dashboard-nvim")
		use("ThePrimeagen/vim-be-good")

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		use("jose-elias-alvarez/null-ls.nvim")
		use("ThePrimeagen/refactoring.nvim")
		use("j-hui/fidget.nvim")
		use({
			"VonHeikemen/lsp-zero.nvim",
			branch = "v1.x",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
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
		})
	end)
end

-- packer bootstrap --
local status, packer = pcall(require, "packer")
if not status then
	vim.notify("packer not installed.", "error")
	-- Auto install packer.nvim
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.isdirectory(install_path) == 0 then
		vim.notify("installing packer...")
		fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd.packadd("packer.nvim")
		local status, packer = pcall(require, "packer")
		if not status then
			vim.notify("failed to load packer", "error")
			return
		end
		packer_startup()
		vim.cmd.PackerSync()
	end
else
	packer_startup()
end
