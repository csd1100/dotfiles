local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
  map('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
  map('n', '<leader>lk', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>lca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>lr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end

require("lspconfigs/nvim-lsp-installer-conf").setup()

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'bashls', 'emmet_ls', 'eslint' , 'rust_analyzer',
    'grammarly', 'jsonls', 'kotlin_language_server', 'pyright', 'tsserver',
    'marksman'
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require('lspconfigs/snippets').setup()
