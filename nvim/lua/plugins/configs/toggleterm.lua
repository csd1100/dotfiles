local M = {}

function M.setup()
    local status, toggleterm = pcall(require, 'toggleterm')
    if not status then
        print('failed to load ' .. 'toggleterm')
        return
    end

    local config = {
        hide_numbers = false, -- hide the number column in toggleterm buffers
        direction = 'horizontal',
        size = 10,
        open_mapping = [[<c-\>]],
        insert_mappings = true, 
        terminal_mappings = true,
    }
    toggleterm.setup(config)

end

return M