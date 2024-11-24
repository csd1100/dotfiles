local ku = require('config.keymap-utils')
return {
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle UndoTree' },
        },
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = {},
    },
    {
        'csd1100/modes.nvim',
        -- dev = true,
        config = true,
        init = function()
            local complModeMaps = {
                ['v'] = {
                    ['"'] = {
                        ['rhs'] = '<ESC>`>a"<ESC>`<i"<ESC>',
                        ['opts'] = {},
                    },
                    ["'"] = {
                        ['rhs'] = "<ESC>`>a'<ESC>`<i'<ESC>",
                        ['opts'] = {},
                    },
                    ['`'] = {
                        ['rhs'] = '<ESC>`>a`<ESC>`<i`<ESC>',
                        ['opts'] = {},
                    },
                    ['('] = {
                        ['rhs'] = '<ESC>`>a)<ESC>`<i(<ESC>',
                        ['opts'] = {},
                    },
                    ['['] = {
                        ['rhs'] = '<ESC>`>a]<ESC>`<i[<ESC>',
                        ['opts'] = {},
                    },
                    ['{'] = {
                        ['rhs'] = '<ESC>`>a}<ESC>`<i{<ESC>',
                        ['opts'] = {},
                    },
                    -- cause < in "v" mode adjusts indentation
                    ['<leader><'] = {
                        ['rhs'] = '<ESC>`>a><ESC>`<i<<ESC>',
                        ['opts'] = {},
                    },
                },
                ['i'] = {
                    ['"'] = { ['rhs'] = '""<left>', ['opts'] = {} },
                    ["'"] = { ['rhs'] = "''<left>", ['opts'] = {} },
                    ['`'] = { ['rhs'] = '``<left>', ['opts'] = {} },
                    ['('] = { ['rhs'] = '()<left>', ['opts'] = {} },
                    ['['] = { ['rhs'] = '[]<left>', ['opts'] = {} },
                    ['{'] = { ['rhs'] = '{}<left>', ['opts'] = {} },
                    ['<'] = { ['rhs'] = '<><left>', ['opts'] = {} },
                    ['{<CR>'] = { ['rhs'] = '{<CR>}<ESC>O', ['opts'] = {} },
                },
            }

            local modes = require('modes')
            modes.create_if_not_present(
                'COMPL',
                function() end,
                function() end,
                " '' "
            )
            modes.add_maps('COMPL', complModeMaps)
            -- enable quotes completion by default --
            modes.toggle_mode('COMPL')
            -- autocomplete brackets and quotes
            ku.map(
                'n',
                "<leader>''",
                ":lua require('modes').toggle_mode('COMPL')<CR>",
                { desc = 'Toggle COMPL Mode' }
            )
            ku.map(
                'n',
                "<leader>'",
                ":lua require('modes').toggle_mode('COMPL',{ buffer = vim.api.nvim_get_current_buf()})<CR>",
                { desc = 'Toggle COMPL Mode for Current Buffer' }
            )
        end,
    },
}
