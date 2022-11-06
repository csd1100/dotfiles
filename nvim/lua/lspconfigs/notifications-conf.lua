local M = {}

function M.setup()
    -- LSP notifications --
    local status, notify = pcall(require, 'notify')
    if status then
        vim.notify = notify
        vim.lsp.handlers['$/progress'] = require('plugins.configs.notifications').handle_notifications
        local severity = {
            'error',
            'warn',
            'info',
            'info', -- map both hint and info to info?
        }
        vim.lsp.handlers['window/showMessage'] = function(err, method, params, client_id)
            vim.notify(method.message, severity[params.type])
        end
    end

end

return M
