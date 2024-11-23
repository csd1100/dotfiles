local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true,
    }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.unmap(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

function M.tbl_extend(table, appendValue)
    return vim.tbl_extend("force", table, appendValue)
end

return M
