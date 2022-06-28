local M = {}
local set = vim.opt

function M.setup()
    local ib = require('indent_blankline')

    set.list = true
    set.listchars:append('space:⋅')
    set.listchars:append('eol:↴')

    local conf = {
        show_end_of_line = true,
        space_char_blankline = ' '
    }

    ib.setup(conf)
end

return M