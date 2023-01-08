local status, mason = pcall(require, "mason")
if not status then
	vim.notify("failed to load mason", "error")
	return
end
mason.setup()
