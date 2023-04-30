local M = {}

function M.if_successful(plug)
    local status, plugin = pcall(require, plug)
    if not status then
        vim.notify("failed to load " .. plug, "error")
        return
    end
    return plugin
end

function M.DeepPrint(table)
    print(vim.inspect(table))
end

function M.tableLength(tbl)
    return #vim.tbl_keys(tbl)
end

function M.appendToTable(table, appendValue)
    local test = vim.tbl_extend("force", table, appendValue)
    return test
end

function M.reset_required(module)
    package.loaded[module] = nil
end

return M
