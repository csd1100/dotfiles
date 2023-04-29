local filetypes = {
    "java",
    "javascript",
    "typescript",
    "go",
    "rust",
}
return {
    {
        "mfussenegger/nvim-dap",
        ft = filetypes,
    },
    {
        "rcarriga/nvim-dap-ui",
        main = "dapui",
        ft = filetypes,
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {
            icons = {
                expanded = "▾",
                collapsed = "▸",
            },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            expand_lines = vim.fn.has("nvim-0.7"),
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.25,
                        },
                        "stacks",
                    },
                    size = 40, -- 40 columns
                    position = "left",
                },
                {
                    elements = { "console" },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
            floating = {
                max_height = nil,
                max_width = nil,
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = {
                indent = 1,
            },
            render = {
                max_type_length = nil, -- Can be integer or nil.
            },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")

            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            dapui.setup(opts)

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        ft = filetypes,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
        },
        opts = {
            highlight_new_as_changed = true,
            all_frames = true,
            only_first_definition = false,
        },
        config = true,
    },
    {
        "nvim-neotest/neotest",
        ft = filetypes,
        config = function()
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message = diagnostic.message
                            :gsub("\n", " ")
                            :gsub("\t", " ")
                            :gsub("%s+", " ")
                            :gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                adapters = {
                    require("neotest-plenary"),
                    require("neotest-go"),
                    require("neotest-jest"),
                    require("neotest-vitest"),
                    require("neotest-plenary"),
                },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            {
                "nvim-neotest/neotest-go",
                ft = "go",
            },
            {
                "nvim-neotest/neotest-jest",
                ft = {
                    "javascript",
                    "typescript",
                },
            },
            {
                "adrigzr/neotest-mocha",
                ft = {
                    "javascript",
                    "typescript",
                },
            },
            {
                "marilari88/neotest-vitest",
                ft = {
                    "javascript",
                    "typescript",
                },
            },
            {
                "nvim-neotest/neotest-plenary",
                ft = "lua",
            },
        },
    },
}
