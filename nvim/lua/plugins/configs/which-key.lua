local status, whichkey = pcall(require, "which-key")
if not status then
	vim.notify("failed to load whichkey.", "error")
	return
end

whichkey.register({
	[":"] = "which_key_ignore",
})
