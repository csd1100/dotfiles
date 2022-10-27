local keymapUtils = require 'basic.keymaps-utils'
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local M = {}

local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr
}

function M.map_lsp_keys()
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', '<C-g>', ':Telescope lsp_document_symbols<CR>', bufopts)
    map('n', '<C-i>', ':Telescope lsp_implementations<CR>', bufopts)
    map('n', '<C-d>', vim.lsp.buf.definition, bufopts)
    map('n', '<C-S-u>', ':Telescope lsp_references<CR>', bufopts)
    map('n', '<C-S-->', ':Telescope lsp_incoming_calls<CR>', bufopts)
    map('n', '<C-S-=>', ':Telescope lsp_outgoing_calls<CR>', bufopts)

    map('n', '<leader>lk', vim.lsp.buf.signature_help, bufopts)
    map('n', '<leader>ltd', vim.lsp.buf.type_definition, bufopts)
    map('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
    map('n', '<leader>lca', vim.lsp.buf.code_action, bufopts)
    map('n', '<leader>lf', vim.lsp.buf.format, bufopts)

    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

function M.unmap_lsp_keys()
    unmap('n', 'K')
    unmap('n', '<C-g>')
    unmap('n', '<C-i>')
    unmap('n', '<C-d>')
    unmap('n', '<C-S-u>')
    unmap('n', '<C-S-->')
    unmap('n', '<C-S-=>')
    unmap('n', '<leader>lk')
    unmap('n', '<leader>ltd')
    unmap('n', '<leader>lrn')
    unmap('n', '<leader>lca')
    unmap('n', '<leader>lf')
    unmap('n', '<leader>wa')
    unmap('n', '<leader>wr')
    unmap('n', '<leader>wl')
end

return M
