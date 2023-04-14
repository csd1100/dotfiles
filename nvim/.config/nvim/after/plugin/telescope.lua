local status, telescope = pcall(require, "telescope")
if not telescope then
	vim.notify("failed to load telescope", "error")
	return
end
local lga_actions = require("telescope-live-grep-args.actions")

local layout_conf = {
	horizontal = {
		height = 0.9,
		preview_cutoff = 120,
		prompt_position = "bottom",
		width = 0.8,
		preview_width = 75,
	},
}

local conf = {
	defaults = {
		path_display = {
			shorten = { len = 2, exclude = { -1 } },
		},
		layout_strategy = "horizontal",
		layout_config = layout_conf,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-u",
			"--ignore",
			"--hidden",
			"--no-ignore-vcs",
			"-g",
			"!.git",
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--ignore", "--hidden", "--no-ignore-vcs", "-g", "!.git" },
			prompt_prefix = "🔍",
		},
		buffers = {
			sort_mru = true,
			ignore_current_buffer = true,
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					['<C-k>'] = lga_actions.quote_prompt(),
					['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
					['<C-n>'] = lga_actions.quote_prompt({ postfix = ' --iglob "!node_modules/**"' }),
				},
			},
			theme = "dropdown", -- use dropdown theme
		},
	},
}

telescope.setup(conf)
telescope.load_extension("live_grep_args")
