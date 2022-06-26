local M = {}

function M.setup()
    local lspi = require("nvim-lsp-installer")
    local conf = {
        ensure_installed = {"jdtls", "sumneko_lua", "marksman", "yamlls",
            "lemminx", "jsonls", "eslint", "tsserver", "html", "emmet_ls",
            "grammarly", "bashls"},

        automatic_installation = false,
        
        -- debugging issues with server installations.
        log_level = vim.log.levels.INFO,

        -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
        -- servers that are requested to be installed will be put in a queue.
        max_concurrent_installers = 4,
    }
    lspi.setup(conf)
end

return M
