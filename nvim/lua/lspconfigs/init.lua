local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

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
local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }
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
end

if_successful('lspconfigs.nvim-lsp-installer-conf').setup()

local lspconfig = if_successful('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = if_successful('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'bashls', 'emmet_ls', 'eslint', 'rust_analyzer', 'grammarly', 'jsonls', 'kotlin_language_server',
                 'pyright', 'tsserver', 'marksman', 'sumneko_lua'}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

if_successful('lspconfigs.lua.sumneko_lua').setup()
if_successful('lspconfigs.java.jdtls').setup()
if_successful('lspconfigs.snippets').setup()
