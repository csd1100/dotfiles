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
    map('n', '<leader>joi', '<cmd>lua require("jdtls").organize_imports()<CR>')
    map('n', '<leader>jev', '<cmd>lua require("jdtls").extract_variable()<CR>')
    map('n', '<leader>jvt', '<cmd>lua require("jdtls").extract_variable(true)<CR>')
    map('n', '<leader>jec', '<cmd>lua require("jdtls").extract_variable()<CR>')
    map('n', '<leader>jct', '<cmd>lua require("jdtls").extract_variable(true)<CR>')
    map('n', '<leader>jem', '<cmd>lua require("jdtls").extract_method(true)<CR>')
    map('n', '<leader>jtc', '<cmd>lua require("jdtls").test_class()<CR>')
    map('n', '<leader>jtm', '<cmd>lua require("jdtls").test_class()<CR>')

end

return M
