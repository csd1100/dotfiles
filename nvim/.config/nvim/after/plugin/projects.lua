local status, projects = pcall(require, "project_nvim")
if status then
	local conf = {
		-- Manual mode doesn't automatically change your root directory, so you have
		-- the option to manually do so using `:ProjectRoot` command.
		manual_mode = false,

		detection_methods = { "pattern" },

		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "build.gradle", "pom.xml" },

		-- Table of lsp clients to ignore by name
		-- eg: { "efm", ... }
		ignore_lsp = {},

		-- Don't calculate root dir on specific directories
		-- Ex: { "~/.cargo/*", ... }
		exclude_dirs = {},

		-- Show hidden files in telescope
		show_hidden = false,

		-- When set to false, you will get a message when project.nvim changes your
		-- directory.
		silent_chdir = false,

		-- What scope to change the directory, valid options are
		-- * global (default)
		-- * tab
		-- * win
		scope_chdir = "global",

		-- Path where project.nvim will store the project history for use in
		-- telescope
		datapath = vim.fn.stdpath("data"),
	}
	projects.setup(conf)
	require("telescope").load_extension("projects")
end
