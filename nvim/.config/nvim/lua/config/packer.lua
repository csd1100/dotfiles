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
		use("folke/zen-mode.nvim")
		use("ThePrimeagen/vim-be-good")
		use("jose-elias-alvarez/null-ls.nvim")
		use("ThePrimeagen/refactoring.nvim")
		use("j-hui/fidget.nvim")
		use("mfussenegger/nvim-jdtls")
		use("csd1100/csd-snips.nvim")
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
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
