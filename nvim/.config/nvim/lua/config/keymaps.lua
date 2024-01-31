local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map

local function tbl_extend(table, appendValue)
    local test = vim.tbl_extend("force", table, appendValue)
    return test
end

local modes_module = require("modes")

local M = {}

function M.general() end

function M.telescope(plugin)
    local builtin = require("telescope.builtin")
    -- colorscheme
    map("n", "<leader>cs", builtin.colorscheme, { desc = "Change colorscheme" })
    -- Recent files
    map("n", "<leader>to", builtin.oldfiles, { desc = "Recent Files" })
    -- Files
    map("n", "<leader><leader>", builtin.find_files, { desc = "Find File" })
    -- -- String search
    map(
        "n",
        "<leader>f",
        plugin.extensions.live_grep_args.live_grep_args,
        { desc = "Grep string" }
    )
    map(
        "v",
        "<leader>f",
        require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
        {
            desc = "Grep word under cursor",
        }
    )
    -- buffers
    map("n", "<leader>b", builtin.buffers, { desc = "List Open Buffers" })
    -- projects
    map("n", "<leader>gp", ":Telescope projects<CR>", { desc = "Projects" })
    -- neovim help
    map("n", "<C-S-h>", builtin.help_tags, { desc = "Help" })
    -- notifications
    map("v", "<leader>n", function()
        plugin.extensions.notify.notify()
    end, { desc = "Notifications" })
    -- Resume last search
    map("n", "<C-S-f><C-S-f>", builtin.resume, { desc = "Resume search" })
end

function M.comment()
    -- Comment Toggle --
    map(
        "n",
        "<leader>/",
        ":CommentToggle<CR>",
        { desc = "Comment current Line" }
    )
    map(
        "v",
        "<leader>/",
        ":'<,'>CommentToggle<CR>",
        { desc = "Comment Selection" }
    )
end

function M.undotree()
    map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Show Undotree" })
end

function M.todo(plugin)
    map("n", "]t", function()
        plugin.jump_next()
    end, { desc = "Next todo comment" })

    map("n", "[t", function()
        plugin.jump_prev()
    end, { desc = "Previous todo comment" })
end

function M.treesitter()
    local ts_repeat_move =
        require("nvim-treesitter.textobjects.repeatable_move")

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
end

function M.harpoon(plugin)
    map("n", "<leader>ha", function()
        plugin:list():append()
    end, { desc = "Harpoon add" })
    map("n", "<leader>hm", function()
        plugin.ui:toggle_quick_menu(plugin:list())
    end, { desc = "Harpoon Menu" })

    map("n", "<leader>1", function()
        plugin:list():select(1)
    end, { desc = "Harpoon 1" })
    map("n", "<leader>2", function()
        plugin:list():select(2)
    end, { desc = "Harpoon 2" })

    map("n", "<leader>3", function()
        plugin:list():select(3)
    end, { desc = "Harpoon 3" })

    map("n", "<leader>4", function()
        plugin:list():select(4)
    end, { desc = "Harpoon 4" })
end

function M.csd_snips()
    local csd_snips = require("csd-snips")
    map({ "n" }, "<leader>dcl", function()
        csd_snips.write_to_console()
    end, { desc = "Write debug message for STDOUT (csd-snips)" })
    map({ "n" }, "<leader>dl", function()
        csd_snips.write_to_logger()
    end, { desc = "Write debug message for logger (csd-snips)" })
    map({ "n" }, "<leader>ddc", function()
        csd_snips.debug_to_console()
    end, { desc = "Write debug message for STDOUT (csd-snips)" })
    map({ "n" }, "<leader>ddl", function()
        csd_snips.debug_to_logger()
    end, { desc = "Write debug message for logger (csd-snips)" })
    map({ "n" }, "<leader>dcs", function()
        csd_snips.debug_string_to_console()
    end, { desc = "Write debug message for STDOUT (csd-snips)" })
    map({ "n" }, "<leader>dls", function()
        csd_snips.debug_string_to_logger()
    end, { desc = "Write debug message for logger (csd-snips)" })
end

function M.markdown_preview()
    map(
        "n",
        "<leader>mdp",
        "<cmd>MarkdownPreview<CR>",
        { desc = "Markdown Preview" }
    )
end

function M.gitsigns()
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
                ["opts"] = tbl_extend(
                    opts,
                    { desc = "Toggle Blame Current Line" }
                ),
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
    --
end

function M.debug()
    local opts = {}
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

function M.test()
    local opts = {}
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
                ["opts"] = tbl_extend(
                    opts,
                    { desc = "Jump to Next Failed test" }
                ),
            },
        },
    }
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
end

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

return M
