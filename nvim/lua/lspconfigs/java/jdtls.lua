local keymapUtils = require('basic.keymaps-utils')
local map = keymapUtils.map
local unmap = keymapUtils.unmap

local M = {}

function M.setup()
    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    local lsp_keymaps = require('lspconfigs.keymaps')

    local lspTogggle = function(self)
        if self.value then
            lsp_keymaps.map_lsp_keys()
            map('n', '<leader>joi', '<Cmd>lua require("jdtls").organize_imports()<CR>')
            map('n', '<leader>jev', '<Cmd>lua require("jdtls").extract_variable()<CR>')
            map('n', '<leader>jvt', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
            map('n', '<leader>jec', '<Cmd>lua require("jdtls").extract_variable()<CR>')
            map('n', '<leader>jct', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
            map('n', '<leader>jem', '<Cmd>lua require("jdtls").extract_method(true)<CR>')
            map('n', '<leader>jtc', '<Cmd>lua require("jdtls").test_class()<CR>')
            map('n', '<leader>jtm', '<Cmd>lua require("jdtls").test_nearest_method()<CR>')
        else
            lsp_keymaps.unmap_lsp_keys()
            unmap('n', '<leader>joi')
            unmap('n', '<leader>jev')
            unmap('n', '<leader>jvt')
            unmap('n', '<leader>jec')
            unmap('n', '<leader>jct')
            unmap('n', '<leader>jem')
            unmap('n', '<leader>jtc')
            unmap('n', '<leader>jtm')
        end
    end

    keymapUtils.getModeClass().new('LSP', lspTogggle)
end

return M
