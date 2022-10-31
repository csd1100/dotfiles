local M = {}

function M.if_successful(plug)
    local status, plugin = pcall(require, plug)
    if not status then
        vim.notify('failed to load ' .. plug, 'error')
        return
    end
    return plugin
end

function M.if_successful_then_setup(plug)
    local plugin = M.if_successful(plug)
    if not plugin then
        vim.notify('failed to load and setup ' .. plug, 'error')
        return
    end
    plugin.setup()
end

return M
