local M = {}

M.config = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    }
}

function M.update_config(on_attach, capabilities)
    M.config.server.capabilities = capabilities
    M.config.server.on_attach = on_attach
end

return M
