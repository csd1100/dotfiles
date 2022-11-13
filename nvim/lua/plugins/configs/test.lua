local status, neotest = pcall(require, "neotest")
if not status then
	vim.notify("failed to load neotest", "error")
	return
end

local M = {}

function M.setup()
	local conf = {
		adapters = {
			require("neotest-rust")({}),
			require("neotest-plenary"),
		},
		icons = {
			failed = "",
			passed = "",
			running = "",
			running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
			skipped = "",
			unknown = "",
		},
		floating = {
			max_width = 0.9,
		},
	}

	neotest.setup(conf)

	local status, nvim_test = pcall(require, "nvim-test")
	if not status then
		vim.notify("failed to load nvim-test", "error")
		return
	end

	local nvim_test_conf = {
		run = true, -- run tests (using for debug)
		commands_create = true, -- create commands (TestFile, TestLast, ...)
		filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
		silent = false, -- less notifications
		term = "terminal", -- a terminal to run ('terminal'|'toggleterm')
		termOpts = {
			direction = "vertical", -- terminal's direction ('horizontal'|'vertical'|'float')
			width = 96, -- terminal's width (for vertical|float)
			height = 24, -- terminal's height (for horizontal|float)
			go_back = false, -- return focus to original window after executing
			stopinsert = "auto", -- exit from insert mode (true|false|'auto')
			keep_one = true, -- keep only one terminal for testing
		},
		runners = { -- setup tests runners
			javascript = "nvim-test.runners.mocha",
		},
	}
	nvim_test.setup(nvim_test_conf)
	require("plugins.configs.test-runner.mocha").setup()
end

return M
