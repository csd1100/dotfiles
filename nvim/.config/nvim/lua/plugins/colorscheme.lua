vim.opt.termguicolors = true
vim.opt.background = "dark"

return {

	{
		"sonph/onehalf",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
			vim.cmd.colorscheme("onehalfdark")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function(plugin)
			-- -- gruvbox-material conf --
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_foreground = "mix"
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
