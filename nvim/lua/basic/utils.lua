local M = {}

function M.if_successful(plug)
    local status, plugin = pcall(require, plug)
    if not status then
        print('failed to load ' .. plug)
        return
    end
    return plugin
end

function M.if_successful_then_setup(plug)
    local plugin = M.if_successful(plug)
    if not plugin then
        print('failed to load and setup ' .. plug)
        return
    end
    plugin.setup()
end

return M
