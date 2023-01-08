local M = {}

function M.setup()
	local status, dap = pcall(require, "dap")
	if not status then
		vim.notify("failed to load dap", "error")
		return
	end
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Debug (Attach) - Remote",
			hostName = "127.0.0.1",
			port = 8000,
		},
	}
end

return M
