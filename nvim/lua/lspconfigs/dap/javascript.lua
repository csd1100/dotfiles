local M = {}

function M.setup()
	local status, dap = pcall(require, "dap")
	if not status then
		vim.notify("failed to load dap", "error")
		return
	end

	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/src/nodeDebug.ts" },
	}

	dap.adapters.chrome = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "~/.local/share/nvim/mason/packages/chrome-debug-adapter/src/chromeDebug.ts" },
	}

	dap.configurations.javascript = {
		{
			name = "Launch",
			type = "node2",
			request = "launch",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
			name = "Attach to process",
			type = "node2",
			request = "attach",
			processId = require("dap.utils").pick_process,
		},
		{
			name = "Attach to process 2 Work",
			type = "node2",
			request = "attach",
			port = 5000,
			localRoot = "${workspaceFolder}",
			remoteRoot = "/path/to/src",
		},
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}
end

return M
