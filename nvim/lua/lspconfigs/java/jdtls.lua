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
