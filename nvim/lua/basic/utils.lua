local M = {}

function M.DeepPrint(e)
    -- if e is a table, we should iterate over its elements
    if type(e) == "table" then
        for k, v in pairs(e) do -- for every element in the table
            print(k)
            DeepPrint(v) -- recursively repeat the same procedure
        end
    else -- if not, we can just print it
        print(e)
    end
end

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
