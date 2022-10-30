local status, lspconfig = pcall(require, 'lspconfig')
if not status then
    print('failed to load lspconfig')
    return
end

local status, cnl = pcall(require, 'cmp_nvim_lsp')
if not status then
    print('failed to load cmp_nvim_lsp')
    return
end

local status, mason = pcall(require, 'mason')
if not status then
    print('failed to load mason')
    return
end

local status, lspi = pcall(require, 'mason-lspconfig')
if not status then
    print('failed to load mason-lspconfig')
    return
end

local utils = require 'basic.utils'
local keymapUtils = require 'basic.keymaps-utils'
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local conf = {
    ensure_installed = { 'sumneko_lua', 'bashls' },

    automatic_installation = false,

    -- debugging issues with server installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4
}
lspi.setup(conf)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attached = function(client, bufnr)
    local lsp_keymaps = require('lspconfigs.keymaps')

    local lspTogggle = function(self)
        if self.value then
            lsp_keymaps.map_lsp_keys()
        else
            lsp_keymaps.unmap_lsp_keys()
        end
    end

    local LSP_MODE = keymapUtils.getModeClass().new('LSP', lspTogggle)
    LSP_MODE:toggle()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cnl.update_capabilities(capabilities)

require('lspconfigs.lua.sumneko_lua')
require('lspconfigs.rust.rust-analyzer')
require('lspconfigs.snippets')

lspi.setup_handlers {
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup {
            on_attach = on_attached,
            capabilities = capabilities
        }
    end,
    ["jdtls"] = function(server_name)
        local status, _ = pcall(require, 'jdtls')
        if not status then
            print('failed to load nvim-jdtls. loading mason config')
            lspconfig[server_name].setup {
                on_attach = on_attached,
                capabilities = capabilities
            }
            return
        else
            require('lspconfigs.java.jdtls')
        end
    end
}
