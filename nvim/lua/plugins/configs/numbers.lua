local M = {}

function M.setup()
    local status, numbers = pcall(require, 'numbers')
    if not status then
        print('failed to load ' .. 'numbers')
        return
    end

    local config = {
        excluded_filetypes = {'nerdtree', 'dashboard'}
    }

    numbers.setup(config)

end

return M