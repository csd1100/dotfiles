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
                            desc = "Load Last Session of CWD",
                            desc_hl = "String",
                            key = "l",
                            key_hl = "Number",
                            action = "lua require('persistence').load()",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Open a new file        ",
                            desc_hl = "String",
                            key = "n",
                            key_hl = "Number",
                            action = "new",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Open Explorer          ",
                            desc_hl = "String",
                            key = "e",
                            key_hl = "Number",
                            action = "Ex",
                        },
                    },
                    footer = {},
                },
                hide = {
                    true,
                    true,
                    true,
                },
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local modesModule = require("modes")
            local function getCustomGlobalModes()
                return table.concat(modesModule.getActiveModesIcons("*"), " | ")
            end

            local function getCustomBufferModes()
                return table.concat(
                    modesModule.getActiveModesIcons(
                        vim.api.nvim_get_current_buf()
                    ),
                    " | "
                )
            end

            local conf = {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = {
                        left = "",
                        right = "",
                    },
                    section_separators = {
                        left = "",
                        right = "",
                    },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { "mode", getCustomGlobalModes },
                    lualine_b = {
                        getCustomBufferModes,
                        "branch",
                        "diff",
                        "diagnostics",
                    },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
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
        opts = {
            show_end_of_line = true,
            space_char_blankline = " ",
            space_char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
        },
        config = function(_, opts)
            vim.opt.list = true
            vim.opt.listchars:append("eol:↴")
            vim.g.indent_blankline_char = ""

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
            require("indent_blankline").setup(opts)
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        main = "colorizer",
        config = true,
    },
}
