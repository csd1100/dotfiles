local M = {}

M.config = {
    _initialized = false,
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = {},
}

function M.update_config(on_attach, capabilities)
    M.config.server.capabilities = capabilities
    M.config.server.on_attach = on_attach
end

return M
