local M = {}

function M.setup()
    cl = require 'nvim-cursorline'
    local conf = {
        cursorline = {
            enable = true,
            timeout = 1000,
            number = false
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = {
                underline = true
            }
        }
    }
    cl.setup(conf)
end

return M