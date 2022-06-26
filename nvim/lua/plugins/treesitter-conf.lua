local M = {}

function M.setup()
    local ts = require('nvim-treesitter.configs')

    local conf = {
      highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
    }

    ts.setup(conf)
end

return M
