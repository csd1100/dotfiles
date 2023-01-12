local keymapUtils = require("basic.keymaps-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap
local utils = require("basic.utils")
local tbl_extend = utils.appendToTable

-- Comment Toggle --
map("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment current Line" })
map("v", "<leader>/", ":'<,'>CommentToggle<CR>", { desc = "Comment Selection" })

-- NvimTree --
map("n", "<leader><S-f>", ":NvimTreeFocus<CR>", { desc = "Focus on Files" })
map("n", "<C-S-E>", ":NvimTreeOpen<CR>", { desc = "Open Files" })

-- SideBar --
map("n", "<C-S-B>", ":SidebarNvimFocus<CR>", { desc = "Open SideBar" })

-- close all open sidebars --
map("n", "<C-S-K>", ":SidebarNvimClose<CR>|:NvimTreeClose<CR>", { desc = "Close Sidebars" })

-- Global --
map("n", "<leader>cs", ":Telescope colorscheme<CR>", { desc = "Chnage colorscheme" })
map("n", "<leader>h", ":Telescope oldfiles<CR>", { desc = "Recent Files" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find in Files" })
map("n", "<leader>b", ":Telescope buffers<CR>", { desc = "List Open Buffers" })
map("n", "<leader>gp", ":Telescope projects<CR>", { desc = "Projects" })
-- map("n", "<C-S-f>", ":Telescope live_grep<CR>", { desc = "Find String in all files" })
map("n", "<C-S-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "<leader>gss", ":SessionSave<CR>", { desc = "Save Current Session" })
map("n", "<leader>gsl", ":SessionLoad<CR>", { desc = "Load Saved Session" })
map("n", "<C-S-n>", ":DashboardNewFile<CR>", { desc = "New Blank File" })
map(
	"n",
	"<leader>ps",
	":PackerSnapshot " .. os.date("%Y-%m-%d_%X") .. ".json <CR>",
	{ desc = "Create a Packer Snapshot at current date" }
)
-- markdown preview --
map("n", "<leader>mdp", ":Glow<CR>", { desc = "Markdown Preview using Glow" })

-- ToggleTerm --
map("n", "<C-S-t>", "<Esc>:ToggleTerm size=11 direction=float <CR>", { desc = "Open Floating Terminal" })
-- dap splkey: d --
local activateDebugFn = function(options)
	local opts = {}
	if options and options.buffer then
		opts = tbl_extend(opts, { buffer = options.buffer })
	end
	map(
		"n",
		"<leader>b",
		':lua require"dap".toggle_breakpoint()<CR>',
		tbl_extend(opts, { desc = "Toggle Breakpoint (DEBUG)" })
	)
	map("n", "<leader>d", ':lua require"dap".continue()<CR>', tbl_extend(opts, { desc = "Continue (DEBUG)" }))
	map("n", "<leader><down>", ':lua require"dap".step_over()<CR>', tbl_extend(opts, { desc = "Step Over (DEBUG)" }))
	map("n", "<leader><right>", ':lua require"dap".step_into()<CR>', tbl_extend(opts, { desc = "Step Into (DEBUG)" }))
	map("n", "<leader><left>", ':lua require"dap".step_out()<CR>', tbl_extend(opts, { desc = "Step Out (DEBUG)" }))
end
local deactivateDebugFn = function(options)
	unmap("n", "<leader>b", options)
	unmap("n", "<leader>d", options)
	unmap("n", "<leader><down>", options)
	unmap("n", "<leader><right>", options)
	unmap("n", "<leader><left>", options)
end

-- test splkey: t --
local activateTestModeFn = function(options)
	local opts = {}
	if options and options.buffer then
		opts = tbl_extend(opts, { buffer = options.buffer })
	end
	map(
		"n",
		"<leader>tn",
		':lua require("neotest").run.run()<CR>',
		tbl_extend(opts, { desc = "Run nearest test (TEST)" })
	)
	map(
		"n",
		"<leader>tf",
		':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
		tbl_extend(opts, { desc = "Run current test file (TEST)" })
	)
	map(
		"n",
		"<leader>td",
		':lua require("neotest").run.run({strategy = "dap"})<CR>',
		tbl_extend(opts, { desc = "Run nearest test DAP (TEST)" })
	)
	map(
		"n",
		"<leader>ts",
		':lua require("neotest").run.stop()<CR>',
		tbl_extend(opts, { desc = "Stop current test (TEST)" })
	)
	map(
		"n",
		"<leader>ta",
		':lua require("neotest").run.attach()<CR>',
		tbl_extend(opts, { desc = "Attach to Test (TEST)" })
	)
	map(
		"n",
		"<leader>tr",
		':lua require("neotest").output.open({ enter = true })<CR>',
		tbl_extend(opts, { desc = "Test Results (TEST)" })
	)
	map(
		"n",
		"<leader>ts",
		':lua require("neotest").summary.toggle()<CR>',
		tbl_extend(opts, { desc = "Results Summary (TEST)" })
	)
end
local deactivateTestModeFn = function(options)
	unmap("n", "<leader>tn", options)
	unmap("n", "<leader>tf", options)
	unmap("n", "<leader>td", options)
	unmap("n", "<leader>ts", options)
	unmap("n", "<leader>ta", options)
	unmap("n", "<leader>tr", options)
	unmap("n", "<leader>ts", options)
end

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

	modesModule.createIfNotPresent("TEST", activateTestModeFn, deactivateTestModeFn, "ﭧ")

	map("n", "<leader>T", ":lua require('modes').toggleMode('TEST')<CR>", { desc = "Toggle TEST Mode" })
	map(
		"n",
		"<leader>TT",
		":lua require('modes').toggleMode('TEST',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
		{ desc = "Toggle TEST Mode for Current Buffer" }
	)

	modesModule.createIfNotPresent("DEBUG", activateDebugFn, deactivateDebugFn, "")
	map("n", "<leader>D", ":lua require('modes').toggleMode('DEBUG')<CR>", { desc = "Toggle DEBUG Mode" })
	map(
		"n",
		"<leader>DD",
		":lua require('modes').toggleMode('DEBUG',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
		{ desc = "Toggle DEBUG Mode for Current Buffer" }
	)
end
