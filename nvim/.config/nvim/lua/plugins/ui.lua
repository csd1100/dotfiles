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
                            action = "new",
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
        config = function()
            local left_section_separator = ""
            local right_section_separator = ""
            local left_component_separator = "⎪"
            local right_component_separator = "⎪"

            local function get_vim_mode()
                return string.upper(string.sub(vim.api.nvim_get_mode().mode, 1, 1))
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

            local function treesitter_current_position()
                local node = vim.treesitter.get_node({ 0 })
                local str = ""
                if node ~= nil then
                    if node:type() == "identifier" then
                        str = vim.treesitter.get_node_text(node, 0, {})
                            .. "  "
                            .. str
                    end
                    local parent = node:parent()
                    if parent ~= nil then
                        while parent ~= nil and not parent:equal(node) do
                            if #parent:field("name") > 0 then
                                str = vim.treesitter.get_node_text(
                                    parent:field("name")[1],
                                    0,
                                    {}
                                ) .. "  " .. str
                            end
                            parent = parent:parent()
                        end
                    end
                end
                return str
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
                    lualine_c = { treesitter_current_position },
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
                                active = "lualine_a_inactive", -- Color for active tab.
                                inactive = "lualine_b_inactive", -- Color for inactive tab.
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
        main = "indent_blankline",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append("eol:↴")
            vim.cmd(
                [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
            )

            vim.cmd(
                [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
            )

            vim.g.indent_blankline_filetype_exclude = { "dashboard" }
            local opts = {
                show_end_of_line = true,
                char_highlight_list = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                    "IndentBlanklineIndent3",
                    "IndentBlanklineIndent4",
                    "IndentBlanklineIndent5",
                    "IndentBlanklineIndent6",
                },
            }
            require("indent_blankline").setup(opts)
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "NotifyBackground",
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
                render = "compact",
                stages = "fade",
                timeout = 1000,
                top_down = false,
            })
            vim.notify = require("notify")
        end,
    },
}
