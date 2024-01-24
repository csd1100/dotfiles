local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map

local function tbl_extend(table, appendValue)
    local test = vim.tbl_extend("force", table, appendValue)
    return test
end

-- Comment Toggle --
map("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment current Line" })
map("v", "<leader>/", ":'<,'>CommentToggle<CR>", { desc = "Comment Selection" })

-- Global --
map(
    "n",
    "<leader>cs",
    ":Telescope colorscheme<CR>",
    { desc = "Change colorscheme" }
)
map("n", "<leader>h", ":Telescope oldfiles<CR>", { desc = "Recent Files" })
map(
    "n",
    "<leader><leader>",
    ":Telescope find_files<CR>",
    { desc = "Find in Files" }
)
map("n", "<leader>b", ":Telescope buffers<CR>", { desc = "List Open Buffers" })
map("n", "<leader>gp", ":Telescope projects<CR>", { desc = "Projects" })
map(
    "n",
    "<leader>f",
    ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
)
map(
    "v",
    "<leader>f",
    ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>"
)
map("n", "<C-S-h>", ":Telescope help_tags<CR>")
map("n", "<C-S-f><C-S-f>", ":Telescope resume<CR>")
map("n", "<C-S-n>", ":lua require('telescope').extensions.notify.notify()<CR>")
map(
    "n",
    "<leader>gsl",
    ":lua require('persistence').load()<CR>",
    { desc = "Save Current Session" }
)
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Show Undotree" })
map("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

local ui = require("harpoon.ui")

map(
    "n",
    "<leader>ha",
    ":lua require('harpoon.mark').add_file()<CR>",
    { desc = "Harpoon add" }
)
map(
    "n",
    "<leader>ht",
    ":lua require('telescope').extensions.harpoon.marks()<CR>",
    { desc = "Harpoon Telescope" }
)
map(
    "n",
    "<leader>hm",
    ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
    { desc = "Harpoon Menu" }
)

map("n", "<C-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<C-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<C-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<C-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")

-- temp keymaps for csd-snips till config feature
map(
    { "n" },
    "<leader>dcl",
    ":lua require('csd-snips').write_to_console()<CR>",
    { desc = "Write debug message for STDOUT (csd-snips)" }
)
map(
    { "n" },
    "<leader>dl",
    ":lua require('csd-snips').write_to_logger()<CR>",
    { desc = "Write debug message for logger (csd-snips)" }
)
map(
    { "n" },
    "<leader>ddc",
    ":lua require('csd-snips').debug_to_console()<CR>",
    { desc = "Write debug message for STDOUT (csd-snips)" }
)
map(
    { "n" },
    "<leader>ddl",
    ":lua require('csd-snips').debug_to_logger()<CR>",
    { desc = "Write debug message for logger (csd-snips)" }
)
map(
    { "n" },
    "<leader>dcs",
    ":lua require('csd-snips').debug_string_to_console()<CR>",
    { desc = "Write debug message for STDOUT (csd-snips)" }
)
map(
    { "n" },
    "<leader>dls",
    ":lua require('csd-snips').debug_string_to_logger()<CR>",
    { desc = "Write debug message for logger (csd-snips)" }
)

map(
    "n",
    "<leader>mdp",
    "<cmd>MarkdownPreview<CR>",
    { desc = "Markdown Preview" }
)

map(
    { "n", "v" },
    "<leader>v[",
    ":lua require('gitsigns').prev_hunk()<CR>",
    { desc = "Previous Hunk (GIT)" }
)
map(
    { "n", "v" },
    "<leader>v]",
    ":lua require('gitsigns').next_hunk()<CR>",
    { desc = "Next Hunk (GIT)" }
)
-- -- git splkey: v --
local opts = {}
local gitModeMaps = {
    ["n"] = {
        ["<leader>vs"] = {
            ["rhs"] = function()
                require("gitsigns").stage_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Stage Hunk" }),
        },
        ["<leader>vu"] = {
            ["rhs"] = function()
                require("gitsigns").undo_stage_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Undo Stage Hunk" }),
        },
        ["<leader>vr"] = {
            ["rhs"] = function()
                require("gitsigns").reset_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Reset Hunk" }),
        },
        ["<leader>vp"] = {
            ["rhs"] = function()
                require("gitsigns").preview_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Preview Hunk" }),
        },
        ["<leader>vbf"] = {
            ["rhs"] = function()
                require("gitsigns").blame_line({
                    full = true,
                })
            end,
            ["opts"] = tbl_extend(opts, { desc = "Blame File" }),
        },
        ["<leader>vbc"] = {
            ["rhs"] = function()
                require("gitsigns").toggle_current_line_blame()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Toggle Blame Current Line" }),
        },
        ["<leader>vd"] = {
            ["rhs"] = function()
                require("gitsigns").diffthis()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Diff" }),
        },
        ["<leader>vtd"] = {
            ["rhs"] = function()
                require("gitsigns").toggle_deleted()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Show Deleted Lines" }),
        },
        ["<leader>vS"] = {
            ["rhs"] = function()
                require("gitsigns").stage_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Stage Buffer" }),
        },
        ["<leader>vR"] = {
            ["rhs"] = function()
                require("gitsigns").reset_buffer()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Reset Buffer" }),
        },
    },
    ["v"] = {
        ["<leader>vs"] = {
            ["rhs"] = function()
                require("gitsigns").stage_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Stage Hunk" }),
        },
        ["<leader>vr"] = {
            ["rhs"] = function()
                require("gitsigns").reset_hunk()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Reset Hunk" }),
        },
    },
}

local complModeMaps = {
    ["v"] = {
        ['"'] = { ["rhs"] = '<ESC>`>a"<ESC>`<i"<ESC>', ["opts"] = {} },
        ["'"] = { ["rhs"] = "<ESC>`>a'<ESC>`<i'<ESC>", ["opts"] = {} },
        ["`"] = { ["rhs"] = "<ESC>`>a`<ESC>`<i`<ESC>", ["opts"] = {} },
        ["("] = { ["rhs"] = "<ESC>`>a)<ESC>`<i(<ESC>", ["opts"] = {} },
        ["["] = { ["rhs"] = "<ESC>`>a]<ESC>`<i[<ESC>", ["opts"] = {} },
        ["{"] = { ["rhs"] = "<ESC>`>a}<ESC>`<i{<ESC>", ["opts"] = {} },
        -- cause < in "v" mode adjusts indentation
        ["<leader><"] = { ["rhs"] = "<ESC>`>a><ESC>`<i<<ESC>", ["opts"] = {} },
    },
    ["i"] = {
        ['"'] = { ["rhs"] = '""<left>', ["opts"] = {} },
        ["'"] = { ["rhs"] = "''<left>", ["opts"] = {} },
        ["`"] = { ["rhs"] = "``<left>", ["opts"] = {} },
        ["("] = { ["rhs"] = "()<left>", ["opts"] = {} },
        ["["] = { ["rhs"] = "[]<left>", ["opts"] = {} },
        ["{"] = { ["rhs"] = "{}<left>", ["opts"] = {} },
        ["<"] = { ["rhs"] = "<><left>", ["opts"] = {} },
        ["{<CR>"] = { ["rhs"] = "{<CR>}<ESC>O", ["opts"] = {} },
    },
}

local debugModeMaps = {
    ["n"] = {
        ["<leader>b"] = {
            ["rhs"] = function()
                require("dap").toggle_breakpoint()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Toggle Breakpoint" }),
        },
        ["<leader>D"] = {
            ["rhs"] = function()
                require("dap").continue()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Resume Debug" }),
        },
        ["<leader><down>"] = {
            ["rhs"] = function()
                require("dap").step_over()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Step Over" }),
        },
        ["<leader><right>"] = {
            ["rhs"] = function()
                require("dap").step_into()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Step Into" }),
        },
        ["<leader><left>"] = {
            ["rhs"] = function()
                require("dap").step_out()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Step Out" }),
        },
    },
}

local testModeMaps = {
    ["n"] = {
        ["<leader>tn"] = {
            ["rhs"] = function()
                require("neotest").run.run()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Run Nearest" }),
        },
        ["<leader>tf"] = {
            ["rhs"] = function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            ["opts"] = tbl_extend(opts, { desc = "Run Current File" }),
        },
        ["<leader>ts"] = {
            ["rhs"] = function()
                require("neotest").run.stop()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Stop running test" }),
        },
        ["<leader>td"] = {
            ["rhs"] = function()
                require("neotest").run.run({ strategy = "dap" })
            end,
            ["opts"] = tbl_extend(opts, { desc = "Run with DAP" }),
        },
        ["<leader>ta"] = {
            ["rhs"] = function()
                require("neotest").run.attach()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Attach to test" }),
        },
        ["<leader>top"] = {
            ["rhs"] = function()
                require("neotest").output_panel.toggle()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Toggle Output Panel" }),
        },
        ["<leader>tos"] = {
            ["rhs"] = function()
                require("neotest").summary.toggle()
            end,
            ["opts"] = tbl_extend(opts, { desc = "Toggle Summary" }),
        },
        ["<leader>t["] = {
            ["rhs"] = function()
                require("neotest").jump.prev({ status = "failed" })
            end,
            ["opts"] = tbl_extend(
                opts,
                { desc = "Jump to Previous Failed test" }
            ),
        },
        ["<leader>t]"] = {
            ["rhs"] = function()
                require("neotest").jump.next({ status = "failed" })
            end,
            ["opts"] = tbl_extend(opts, { desc = "Jump to Next Failed test" }),
        },
    },
}

local status, modes_module = pcall(require, "modes")
if status then
    modes_module.create_if_not_present(
        "COMPL",
        function() end,
        function() end,
        " '' "
    )
    modes_module.add_maps("COMPL", complModeMaps)
    -- enable quotes completion by default --
    modes_module.toggle_mode("COMPL")
    -- autocomplete brackets and quotes
    map(
        "n",
        "<leader>''",
        ":lua require('modes').toggle_mode('COMPL')<CR>",
        { desc = "Toggle COMPL Mode" }
    )
    map(
        "n",
        "<leader>'",
        ":lua require('modes').toggle_mode('COMPL',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
        { desc = "Toggle COMPL Mode for Current Buffer" }
    )

    modes_module.create_if_not_present(
        "GIT",
        function() end,
        function() end,
        "  "
    )
    modes_module.add_maps("GIT", gitModeMaps)
    map(
        "n",
        "<leader>vg",
        ":lua require('modes').toggle_mode('GIT')<CR>",
        { desc = "Toggle GIT Mode" }
    )
    map(
        "n",
        "<leader>vb",
        ":lua require('modes').toggle_mode('GIT',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
        { desc = "Toggle GIT Mode for Current Buffer" }
    )

    modes_module.create_if_not_present(
        "TEST",
        function() end,
        function() end,
        "  "
    )
    modes_module.add_maps("TEST", testModeMaps)
    map(
        "n",
        "<leader>tg",
        ":lua require('modes').toggle_mode('TEST')<CR>",
        { desc = "Toggle TEST Mode" }
    )
    map(
        "n",
        "<leader>tb",
        ":lua require('modes').toggle_mode('TEST',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
        { desc = "Toggle TEST Mode for Current Buffer" }
    )

    modes_module.create_if_not_present(
        "DEBUG",
        function() end,
        function() end,
        "  "
    )
    modes_module.add_maps("DEBUG", debugModeMaps)

    map(
        "n",
        "<leader>dg",
        ":lua require('modes').toggle_mode('DEBUG')<CR>",
        { desc = "Toggle DEBUG Mode" }
    )
    map(
        "n",
        "<leader>db",
        ":lua require('modes').toggle_mode('DEBUG',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
        { desc = "Toggle DEBUG Mode for Current Buffer" }
    )
end
