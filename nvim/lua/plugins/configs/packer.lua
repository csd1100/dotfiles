local status, packer = pcall(require, "packer")
if not status then
	vim.notify("failed to load packer", "error")
	return
end

local status, pu = pcall(require, "packer.util")
if not status then
	vim.notify("failed to load packer.util", "error")
	return
end

local conf = {
	display = {
		open_fn = function()
			return pu.float({
				border = "rounded",
			})
		end,
	},
	profile = {
		enable = true,
	},
}
packer.init(conf)
require("plugins.plugin_specification")
