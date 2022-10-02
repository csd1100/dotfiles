local M = {}

function M.setup()
    local status, lspi = pcall(require, 'nvim-lsp-installer')
    if not status then
        print('failed to load ' .. 'nvim-lsp-installer')
        return
    end

    local conf = {
        ensure_installed = { 'sumneko_lua', 'bashls'},

        automatic_installation = false,

        -- debugging issues with server installations.
        log_level = vim.log.levels.INFO,

        -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
        -- servers that are requested to be installed will be put in a queue.
        max_concurrent_installers = 4
    }
    lspi.setup(conf)
end

function M.lsp_setup(lsp_name)
    vim.cmd(string.format(':TSInstall %s', lsp_name))
    vim.cmd(string.format(':LspInstall %s', lsp_name))
end

return M
