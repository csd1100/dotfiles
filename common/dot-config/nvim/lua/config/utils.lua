local modes_module = require('modes')

local M = {}

function M.get_custom_global_modes(separator)
    return table.concat(modes_module.get_active_modes_icons('*'), separator)
end

function M.get_custom_buffer_modes(separator)
    return table.concat(
        modes_module.get_active_modes_icons(vim.api.nvim_get_current_buf()),
        separator
    )
end

return M
