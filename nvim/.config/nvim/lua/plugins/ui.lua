return {

    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "doom",
                "letter",
                config = {
                    header = {
                        [[]],
                        [[]],
                        [[                               __                ]],
                        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
                        [[]],
                        [[]],
                        [[]],
                    },
                    center = {
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Load Last Session of CWD ",
                            desc_hl = "String",
                            key = "l",
                            key_hl = "Number",
                            action = "lua require('persistence').load()",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Open Recently Opened File",
                            desc_hl = "String",
                            key = "h",
                            key_hl = "Number",
                            action = "Telescope oldfiles",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Open a New File          ",
                            desc_hl = "String",
                            key = "n",
                            key_hl = "Number",
                            action = "enew",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Open Explorer            ",
                            desc_hl = "String",
                            key = "e",
                            key_hl = "Number",
                            action = "Ex",
                        },
                    },
                    footer = {},
                },
                hide = {},
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPre",
        config = function()
            local left_section_separator = ""
            local right_section_separator = ""
            local left_component_separator = "⎪"
            local right_component_separator = "⎪"

            local function get_vim_mode()
                return string.upper(
                    string.sub(vim.api.nvim_get_mode().mode, 1, 1)
                )
            end

            local modes_module = require("modes")
            local function get_custom_global_modes()
                return table.concat(
                    modes_module.get_active_modes_icons("*"),
                    left_component_separator
                )
            end

            local function get_custom_buffer_modes()
                return table.concat(
                    modes_module.get_active_modes_icons(
                        vim.api.nvim_get_current_buf()
                    ),
                    left_component_separator
                )
            end

            local conf = {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = {
                        left = left_component_separator,
                        right = right_component_separator,
                    },
                    section_separators = {
                        left = left_section_separator,
                        right = right_section_separator,
                    },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { get_vim_mode },
                    lualine_b = {
                        "branch",
                        "diff",
                    },
                    lualine_c = {},
                    lualine_x = { "diagnostics", "filetype" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = { "location" },
                    lualine_b = { "filename" },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = { get_custom_buffer_modes },
                    lualine_z = { get_custom_global_modes },
                },
                winbar = {
                    lualine_a = {
                        {
                            "tabs",
                            max_length = 1000,
                            tabs_color = {
                                -- Same values as the general color option can be used here.
                                active = "lualine_b_command", -- Color for active tab.
                                inactive = "lualine_a_inactive", -- Color for inactive tab.
                            },
                            mode = 2,
                            fmt = function(name, context)
                                -- Show + if buffer is modified in tab
                                local buflist =
                                    vim.fn.tabpagebuflist(context.tabnr)
                                local winnr = vim.fn.tabpagewinnr(context.tabnr)
                                local bufnr = buflist[winnr]
                                local mod = vim.fn.getbufvar(bufnr, "&mod")

                                return name .. (mod == 1 and " +" or "")
                            end,
                        },
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },

                extensions = {},
            }

            require("lualine").setup(conf)
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        event = "BufReadPost",
        opts = {
            cursorline = {
                enable = true,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = {
                    underline = true,
                },
            },
        },
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        main = "ibl",
        opts = {
            debounce = 100,
            indent = {
                char = "▎",
            },
            whitespace = { highlight = { "Whitespace", "NonText" } },
            exclude = {
                filetypes = { "dashboard" },
            },
        },
        config = function(_, opts)
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            opts["indent"]["highlight"] = highlight

            local hooks = require("ibl.hooks")

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            require("ibl").setup(opts)
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        ft = { "html", "lua", "conf", "css" },
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                -- override_vim_notify = true,
                window = {
                    winblend = 0,
                },
            },
            progress = {
                display = {
                    progress_ttl = 300,
                },
            },
        },
        config = true,
        branch = "main",
    },
    {
        "rcarriga/nvim-notify",
        -- enabled = false,
        config = function()
            local notify_background = "NotifyBackground"
            local background_color = vim.api.nvim_get_hl(
                0,
                { name = notify_background, link = false }
            ).bg
            if background_color == nil then
                notify_background = "#000000"
            end
            local notify = require("notify")
            notify.setup({
                background_colour = notify_background,
                fps = 30,
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "✎",
                    WARN = "",
                },
                level = 2,
                minimum_width = 50,
                render = "wrapped-compact",
                stages = "static",
                timeout = 1500,
            })
            vim.notify = notify
        end,
    },
}
