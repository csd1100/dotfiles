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
                        "scopes",
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        {
                            id = "stacks",
                            size = 0.5,
                        },
                        {
                            id = "watches",
                            size = 0.5,
                        },
                    },
                    size = 8,
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
            require("config.keymaps").debug()
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
        "nvim-telescope/telescope-dap.nvim",
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
            local adapters = {
                require("neotest-plenary"),
                require("neotest-go"),
                require("rustaceanvim.neotest"),
                require("neotest-plenary"),
            }
            if os.getenv("NEOTEST_MOCHA") == "true" then
                table.insert(
                    adapters,
                    require("neotest-vim-test")({
                        allow_file_types = { "javascript" },
                    })
                )
            else
                table.insert(adapters, require("neotest-jest"))
                table.insert(adapters, require("neotest-vitest"))
            end
            require("neotest").setup({
                adapters = adapters,
                icons = {
                    child_indent = "│",
                    child_prefix = "├",
                    collapsed = "─",
                    expanded = "╮",
                    failed = "",
                    final_child_indent = " ",
                    final_child_prefix = "╰",
                    non_collapsible = "─",
                    passed = "",
                    running = "",
                    running_animated = {
                        "󰪞",
                        "󰪟",
                        "󰪠",
                        "󰪡",
                        "󰪢",
                        "󰪣",
                        "󰪤",
                        "󰪥",
                    },
                    skipped = "",
                    unknown = "",
                },
                status = {
                    virtual_text = true,
                },
                output = {
                    open_on_run = true,
                },
            })
            require("config.keymaps").test()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
            "nvim-neotest/neotest-vim-test",
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
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
        },
    },
}
