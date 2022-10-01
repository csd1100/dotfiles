local utils = require 'basic.utils'
local keymapUtils = require 'basic.keymaps-utils'
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attached = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    local lspTogggle = function(self)
        if self.value then
            map('n', '<leader>ldc', vim.lsp.buf.declaration, bufopts)
            map('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
            map('n', 'K', vim.lsp.buf.hover, bufopts)
            map('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
            map('n', '<leader>lk', vim.lsp.buf.signature_help, bufopts)
            map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            map('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            map('n', '<leader>ltd', vim.lsp.buf.type_definition, bufopts)
            map('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
            map('n', '<leader>lca', vim.lsp.buf.code_action, bufopts)
            map('n', '<leader>lr', vim.lsp.buf.references, bufopts)
            map('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
        else
            unmap('n', '<leader>ldc')
            unmap('n', '<leader>ld')
            unmap('n', 'K')
            unmap('n', '<leader>li')
            unmap('n', '<leader>lk')
            unmap('n', '<leader>wa')
            unmap('n', '<leader>wr')
            unmap('n', '<leader>wl')
            unmap('n', '<leader>ltd')
            unmap('n', '<leader>lrn')
            unmap('n', '<leader>lca')
            unmap('n', '<leader>lr')
            unmap('n', '<leader>lf')
        end
    end

    local LSP_MODE = keymapUtils.getModeClass().new('LSP', lspTogggle)
    LSP_MODE:toggle()
end

utils.if_successful_then_setup('lspconfigs.nvim-lsp-installer-conf')

local lspconfig = if_successful('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = if_successful('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'bashls', 'emmet_ls', 'eslint', 'rust_analyzer', 'jsonls', 'kotlin_language_server', 'pyright',
                 'tsserver', 'marksman', 'sumneko_lua'}

utils.if_successful_then_setup('lspconfigs.lua.sumneko_lua')
utils.if_successful_then_setup('lspconfigs.rust.rust-analyzer')
utils.if_successful_then_setup('lspconfigs.snippets')

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attached,
        capabilities = capabilities
    }
end

