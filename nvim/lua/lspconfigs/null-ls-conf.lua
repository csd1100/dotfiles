local M = {}

function M.setup()
    local status, null_ls = pcall(require, 'null-ls')
    if not status then
        vim.notify('failed to load null_ls', 'error')
        return
    end

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.code_actions.refactoring,
        },
    })

end

return M
