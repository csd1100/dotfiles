local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap
local utils = require("config.utils")
local tbl_extend = utils.appendToTable

-- Comment Toggle --
map("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment current Line" })
map("v", "<leader>/", ":'<,'>CommentToggle<CR>", { desc = "Comment Selection" })

-- Global --
map("n", "<leader>cs", ":Telescope colorscheme<CR>", { desc = "Chnage colorscheme" })
map("n", "<leader>h", ":Telescope oldfiles<CR>", { desc = "Recent Files" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find in Files" })
map("n", "<leader>b", ":Telescope buffers<CR>", { desc = "List Open Buffers" })
map("n", "<leader>gp", ":Telescope projects<CR>", { desc = "Projects" })
map("n", "<C-S-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("v", "<C-S-f>", ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>")
map("n", "<C-S-f><C-S-f>", ":Telescope resume<CR>")
map("n", "<leader>gss", ":SessionSave<CR>", { desc = "Save Current Session" })
map("n", "<leader>gsl", ":SessionLoad<CR>", { desc = "Load Saved Session" })
map(
	"n",
	"<leader><S-p>",
	":PackerSnapshot " .. os.date("%Y-%m-%d_%X") .. ".json <CR>",
	{ desc = "Create a Packer Snapshot at current date" }
)
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Show Undotree" })
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map({ "n", "v" }, "<leader>v[", ":lua require('gitsigns').prev_hunk()<CR>", { desc = "Previous Hunk (GIT)" })
map({ "n", "v" }, "<leader>v]", ":lua require('gitsigns').next_hunk()<CR>", { desc = "Next Hunk (GIT)" })
-- -- git splkey: v --
local activateGitsignsFn = function(options)
	local opts = {}
	if options and options.buffer then
		opts = tbl_extend(opts, { buffer = options.buffer })
	end
	map(
		{ "n", "v" },
		"<leader>vs",
		":lua require('gitsigns').stage_hunk()<CR>",
		tbl_extend(opts, { desc = "Stage Hunk (GIT)" })
	)
	map(
		{ "n", "v" },
		"<leader>vr",
		":lua require('gitsigns').reset_hunk()<CR>",
		tbl_extend(opts, { desc = "Reset Hunk (GIT)" })
	)
	map(
		"n",
		"<leader>vS",
		":lua require('gitsigns').stage_buffer()<CR>",
		tbl_extend(opts, { desc = "Stage Buffer (GIT)" })
	)
	map(
		"n",
		"<leader>vu",
		":lua require('gitsigns').undo_stage_hunk()<CR>",
		tbl_extend(opts, { desc = "Undo Stage Hunk (GIT)" })
	)
	map(
		"n",
		"<leader>vR",
		":lua require('gitsigns').reset_buffer()<CR>",
		tbl_extend(opts, { desc = "Reset Buffer (GIT)" })
	)
	map(
		"n",
		"<leader>vp",
		":lua require('gitsigns').preview_hunk()<CR>",
		tbl_extend(opts, { desc = "Preview Hunk (GIT)" })
	)
	map("n", "<leader>vfb", function()
		require("gitsigns").blame_line({
			full = true,
		})
	end, tbl_extend(opts, { desc = "Git Blame Whole File (GIT)" }))
	map(
		"n",
		"<leader>vb",
		":lua require('gitsigns').toggle_current_line_blame()<CR>",
		tbl_extend(opts, { desc = "Git Blame Current Line (GIT)" })
	)
	map("n", "<leader>vd", ":lua require('gitsigns').diffthis()<CR>", tbl_extend(opts, { desc = "Git Diff (GIT)" }))
	map("n", "<leader>vD", function()
		require("gitsigns").diffthis("~")
	end, tbl_extend(opts, { desc = "Git Diff ~ (GIT)" }))
	map(
		"n",
		"<leader>vdd",
		":lua require('gitsigns').toggle_deleted()<CR>",
		tbl_extend(opts, { desc = "Git Toggle Delete (GIT)" })
	)
end
local deacticateGitsignsFn = function(options)
	unmap("n", "<leader>vs", options)
	unmap("v", "<leader>vs", options)
	unmap("n", "<leader>vr", options)
	unmap("v", "<leader>vr", options)
	unmap("n", "<leader>vS", options)
	unmap("n", "<leader>vu", options)
	unmap("n", "<leader>vR", options)
	unmap("n", "<leader>vp", options)
	unmap("n", "<leader>vb", options)
	unmap("n", "<leader>vfb", options)
	unmap("n", "<leader>vd", options)
	unmap("n", "<leader>vD", options)
	unmap("n", "<leader>vdd", options)
end

local activateCompletionToggleFn = function(options)
	-- add brackets and quotes in visual mode
	map("v", '"', [[<ESC>`>a"<ESC>`<i"<ESC>]], options)
	map("v", "'", [[<ESC>`>a'<ESC>`<i'<ESC>]], options)
	map("v", "`", [[<ESC>`>a`<ESC>`<i`<ESC>]], options)
	map("v", "(", [[<ESC>`>a)<ESC>`<i(<ESC>]], options)
	map("v", "[", [[<ESC>`>a]<ESC>`<i[<ESC>]], options)
	map("v", "{", [[<ESC>`>a}<ESC>`<i{<ESC>]], options)
	map("i", '"', '""<left>', options)
	map("i", "'", "''<left>", options)
	map("i", "`", "``<left>", options)
	map("i", "'", "''<left>", options)
	map("i", "(", "()<left>", options)
	map("i", "[", "[]<left>", options)
	map("i", "{", "{}<left>", options)
	map("i", "<", "<><left>", options)
	map("i", "{<CR>", "{<CR>}<ESC>O", options)
end

local deactivateCompletionToggleFn = function(options)
	unmap("v", '"', options)
	unmap("v", "`", options)
	unmap("v", "'", options)
	unmap("v", "(", options)
	unmap("v", "[", options)
	unmap("v", "{", options)
	unmap("i", '"', options)
	unmap("i", "`", options)
	unmap("i", "'", options)
	unmap("i", "(", options)
	unmap("i", "[", options)
	unmap("i", "{", options)
	unmap("i", "<", options)
	unmap("i", "{<CR>", options)
end

local status, modesModule = pcall(require, "modes")
if status then
	modesModule.setup()
	modesModule.createIfNotPresent("COMPL", activateCompletionToggleFn, deactivateCompletionToggleFn, "''")
	-- enable quotes completion by default --
	modesModule.toggleMode("COMPL")
	-- autocomplete brackets and quotes
	map("n", "<leader>'", ":lua require('modes').toggleMode('COMPL')<CR>", { desc = "Toggle COMPL Mode" })
	map(
		"n",
		"<leader>''",
		":lua require('modes').toggleMode('COMPL',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
		{ desc = "Toggle COMPL Mode for Current Buffer" }
	)

	modesModule.createIfNotPresent("GIT", activateGitsignsFn, deacticateGitsignsFn, "")
	map("n", "<leader>V", ":lua require('modes').toggleMode('GIT')<CR>", { desc = "Toggle GIT Mode" })
	map(
		"n",
		"<leader>VV",
		":lua require('modes').toggleMode('GIT',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
		{ desc = "Toggle GIT Mode for Current Buffer" }
	)
end
