local M = {}

local function setupMocha()
	require("nvim-test.runners.mocha"):setup({
		command = vim.fn.fnamemodify(vim.fn.getcwd(), ":p") .. "/node_modules/.bin/mocha", -- a command to run the test runner
		args = { "--collectCoverage=true" }, -- default arguments

		file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",
		find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },

		filename_modifier = nil,
		working_directory = nil,
	})
end

function M.setup()
	local status, _ = pcall(setupMocha)
	if not status then
		vim.notify(
			"Mocha setup did not complete successfully. Make sure to install javascript and typescript tree-sitter parser",
			"error"
		)
	end
end

return M
