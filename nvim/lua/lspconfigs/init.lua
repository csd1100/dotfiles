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

local utils = require 'basic.utils'
local keymapUtils = require 'basic.keymaps-utils'
local map = keymapUtils.map
local unmap = keymapUtils.unmap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attached = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

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

utils.if_successful_then_setup('lspconfigs.nvim-lsp-installer-conf')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cnl.update_capabilities(capabilities)

local servers = { 'bashls', 'emmet_ls', 'eslint', 'rust_analyzer', 'jsonls', 'kotlin_language_server', 'pyright',
    'tsserver', 'marksman', 'sumneko_lua', 'vuels' }

utils.if_successful_then_setup('lspconfigs.lua.sumneko_lua')
utils.if_successful_then_setup('lspconfigs.rust.rust-analyzer')
utils.if_successful_then_setup('lspconfigs.snippets')

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attached,
        capabilities = capabilities
    }
end
