local status, lspconfig = pcall(require, 'lspconfig')
if not status then
    vim.notify('failed to load lspconfig', 'error')
    return
end
local M = {}

function M.update_config(on_attach, capabilities)
    local settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        },
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lspconfig['sumneko_lua'].setup(settings)
end

return M
