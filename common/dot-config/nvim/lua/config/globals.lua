function _G.if_successful(plug)
    local status, plugin = pcall(require, plug)
    if not status then
        vim.notify('failed to load ' .. plug, 'error')
        return
    end
    return plugin
end

function _G.deep_print(table)
    print(vim.inspect(table))
end

function _G.tbl_length(tbl)
    return #vim.tbl_keys(tbl)
end

function _G.reset_required(module)
    package.loaded[module] = nil
end
