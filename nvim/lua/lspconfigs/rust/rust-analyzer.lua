local M = {}

function M.setup()

    local config = {
        tools = { -- rust-tools options
            autoSetHints = true,
            hover_with_actions = true,
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
                }
            }
        }
    }

    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
        print('failed to load ' .. 'rust-tools')
        return
    end

    rust_tools.setup(config)

end

return M
