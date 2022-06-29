local M = {}

function M.setup()
    local status, lspi = pcall(require, 'nvim-lsp-installer')
    if not status then
        print('failed to load ' .. 'nvim-lsp-installer')
        return
    end

    local conf = {
        ensure_installed = {'jdtls@1.8.0-202112170540', 'sumneko_lua', 'marksman', 'yamlls', 'lemminx', 'jsonls', 'eslint', 'tsserver',
                            'html', 'emmet_ls', 'bashls'},

        automatic_installation = false,

        -- debugging issues with server installations.
        log_level = vim.log.levels.INFO,

        -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
        -- servers that are requested to be installed will be put in a queue.
        max_concurrent_installers = 4
    }
    lspi.setup(conf)
end

return M
