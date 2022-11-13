local modesModule = require("basic.modes")
local keymapUtils = require("basic.keymaps-utils")
local map = keymapUtils.map
local unmap = keymapUtils.unmap

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
map("n", "<C-S-f>", ":Telescope live_grep<CR>", { desc = "Find String in all files" })
map("n", "<leader>gss", ":SessionSave<CR>", { desc = "Save Current Session" })
map("n", "<leader>gsl", ":SessionLoad<CR>", { desc = "Load Saved Session" })
map("n", "<C-S-n>", ":DashboardNewFile<CR>", { desc = "New Blank File" })

-- markdown preview --
map("n", "<leader>mdp", ":Glow<CR>", { desc = "Markdown Preview using Glow" })

-- ToggleTerm --
map("n", "<C-S-t>", "<Esc>:ToggleTerm size=11 direction=float <CR>", { desc = "Open Floating Terminal" })
-- dap splkey: d --
local debugToggleFn = function(self, filter)
	if self:isActive(filter) then
		map("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>', { desc = "Toggle Breakpoint (DEBUG)" })
		map("n", "<leader>d", ':lua require"dap".continue()<CR>', { desc = "Continue (DEBUG)" })
		map("n", "<leader><down>", ':lua require"dap".step_over()<CR>', { desc = "Step Over (DEBUG)" })
		map("n", "<leader><right>", ':lua require"dap".step_into()<CR>', { desc = "Step Into (DEBUG)" })
		map("n", "<leader><left>", ':lua require"dap".step_out()<CR>', { desc = "Step Out (DEBUG)" })
	else
		unmap("n", "<leader>b")
		unmap("n", "<leader>d")
		unmap("n", "<leader><down>")
		unmap("n", "<leader><right>")
		unmap("n", "<leader><left>")
	end
end
modesModule.createMode("DEBUG", "", debugToggleFn)
map("n", "<leader>DD", ":lua require('basic.modes').getMode('DEBUG'):toggle()<CR>", { desc = "Toggle DEBUG Mode" })
map(
	"n",
	"<leader>D",
	":lua require('basic.modes').getMode('TEST'):toggle({ buffer = vim.api.nvim_get_current_buf() })<CR>",
	{ desc = "Toggle DEBUG Mode" }
)

-- test splkey: t --
local testToggleFn = function(self, filter)
	if self:isActive(filter) then
		map("n", "<leader>tn", ':lua require("neotest").run.run()<CR>', { desc = "Run nearest test (TEST)" })
		map(
			"n",
			"<leader>tf",
			':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
			{ desc = "Run current test file (TEST)" }
		)
		map(
			"n",
			"<leader>td",
			':lua require("neotest").run.run({strategy = "dap"})<CR>',
			{ desc = "Run nearest test DAP (TEST)" }
		)
		map("n", "<leader>ts", ':lua require("neotest").run.stop()<CR>', { desc = "Stop current test (TEST)" })
		map("n", "<leader>ta", ':lua require("neotest").run.attach()<CR>', { desc = "Attach to Test (TEST)" })
	else
		unmap("n", "<leader>tn")
		unmap("n", "<leader>tf")
		unmap("n", "<leader>td")
		unmap("n", "<leader>ts")
		unmap("n", "<leader>ta")
	end
end
modesModule.createMode("TEST", "ﭧ", testToggleFn)
map("n", "<leader>TT", ":lua require('basic.modes').getMode('TEST'):toggle()<CR>", { desc = "Toggle TEST Mode" })
map(
	"n",
	"<leader>T",
	":lua require('basic.modes').getMode('TEST'):toggle({ buffer = vim.api.nvim_get_current_buf() })<CR>",
	{ desc = "Toggle TEST Mode" }
)

-- git splkey: v --
local gitsignsToggleFn = function(self, filter)
	if self:isActive(filter) then
		map({ "n", "v" }, "<leader>vs", ":lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage Hunk (GIT)" })
		map({ "n", "v" }, "<leader>vr", ":lua require('gitsigns').reset_hunk()<CR>", { desc = "Reset Hunk (GIT)" })
		map("n", "<leader>vS", ":lua require('gitsigns').stage_buffer()<CR>", { desc = "Stage Buffer (GIT)" })
		map("n", "<leader>vu", ":lua require('gitsigns').undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk (GIT)" })
		map("n", "<leader>vR", ":lua require('gitsigns').reset_buffer()<CR>", { desc = "Reset Buffer (GIT)" })
		map("n", "<leader>vp", ":lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview Hunk (GIT)" })
		map("n", "<leader>vfb", function()
			require("gitsigns").blame_line({
				full = true,
			})
		end, { desc = "Git Blame Whole File (GIT)" })
		map(
			"n",
			"<leader>vb",
			":lua require('gitsigns').toggle_current_line_blame()<CR>",
			{ desc = "Git Blame Current Line (GIT)" }
		)
		map("n", "<leader>vd", ":lua require('gitsigns').diffthis()<CR>", { desc = "Git Diff (GIT)" })
		map("n", "<leader>vD", function()
			require("gitsigns").diffthis("~")
		end, { desc = "Git Diff ~ (GIT)" })
		map("n", "<leader>vdd", ":lua require('gitsigns').toggle_deleted()<CR>", { desc = "Git Toggle Delete (GIT)" })
	else
		unmap("n", "<leader>vs")
		unmap("v", "<leader>vs")
		unmap("n", "<leader>vr")
		unmap("v", "<leader>vr")
		unmap("n", "<leader>vS")
		unmap("n", "<leader>vu")
		unmap("n", "<leader>vR")
		unmap("n", "<leader>vp")
		unmap("n", "<leader>vb")
		unmap("n", "<leader>vfb")
		unmap("n", "<leader>vd")
		unmap("n", "<leader>vD")
		unmap("n", "<leader>vdd")
	end
end
modesModule.createMode("GIT", "", gitsignsToggleFn)

map("n", "<leader>VV", ":lua require('basic.modes').getMode('GIT'):toggle()<CR>", { desc = "Toggle GIT Mode" })
map(
	"n",
	"<leader>V",
	":lua require('basic.modes').getMode('GIT'):toggle({ buffer = vim.api.nvim_get_current_buf() })<CR>",
	{ desc = "Toggle GIT Mode" }
)
