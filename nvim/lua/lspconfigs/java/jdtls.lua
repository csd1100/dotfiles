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

local M = {}

function M.setup()
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
    map('n', '<leader>joi', '<Cmd>lua require("jdtls").organize_imports()<CR>')
    map('n', '<leader>jev', '<Cmd>lua require("jdtls").extract_variable()<CR>')
    map('n', '<leader>jvt', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
    map('n', '<leader>jec', '<Cmd>lua require("jdtls").extract_variable()<CR>')
    map('n', '<leader>jct', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
    map('n', '<leader>jem', '<Cmd>lua require("jdtls").extract_method(true)<CR>')
    map('n', '<leader>jtc', '<Cmd>lua require("jdtls").test_class()<CR>')
    map('n', '<leader>jtm', '<Cmd>lua require("jdtls").test_nearest_method()<CR>')
end

return M
