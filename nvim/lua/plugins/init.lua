local status, packer = pcall(require, "packer")
if not status then
	vim.notify("packer not installed.", "error")
end

local fn = vim.fn

-- Auto install packer.nvim
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.isdirectory(install_path) == 0 then
	vim.notify("installing packer...")
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])

	local status, _ = pcall(require, "plugins.plugin_specification")
	if not status then
		vim.notify("failed to load plugin specifications", "error")
		return
	end

	local status, packer = pcall(require, "packer")
	if not status then
		vim.notify("failed to load packer", "error")
		return
	end

	vim.cmd('autocmd User PackerComplete ++once lua require("plugins.config")')
	packer.sync()
else
	require("plugins.config")
end
