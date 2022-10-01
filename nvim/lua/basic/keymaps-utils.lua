local M = {}

M.Modes = {}

function M.getActiveModes(modes)
    activeModes = {}
    for k, v in pairs(modes) do
        if v.value then
            table.insert(activeModes, v.id)
        end
    end
    return table.concat(activeModes, ", ")
end

function M.map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.unmap(mode, lhs)
    vim.api.nvim_del_keymap(mode, lhs)
end

Mode = {
    id = 'Mode',
    value = false,
    toggleFn = nil
}
Mode.__index = Mode

function Mode:toggle()
    self.value = not self.value
    self:toggleFn()
end

function Mode.new(id, toggleFn)
    this = setmetatable({}, Mode)
    this.id = id
    this.toggleFn = toggleFn
    M.Modes[this.id] = this
    return this
end

local debugToggleFn = function(self)
    if self.value then
        M.map('n', 'ð', ':lua require"dap".toggle_breakpoint()<CR>')
        M.map('n', '.', ':lua require"dap".continue()<CR>')
        M.map('n', '<leader><down>', ':lua require"dap".step_over()<CR>')
        M.map('n', '<leader><right>', ':lua require"dap".step_into()<CR>')
        M.map('n', '<leader><left>', ':lua require"dap".step_out()<CR>')
    else
        M.unmap('n', 'ð')
        M.unmap('n', '.')
        M.unmap('n', '<leader><down>')
        M.unmap('n', '<leader><right>')
        M.unmap('n', '<leader><left>')
    end
end

local lspToggleFn = function(self)
    if self.value then
        M.map('i', 'jj', '<Esc>')
    else
        M.unmap('i', 'jj')
    end
end

local filesToggleFn = function(self)
    if self.value then
        -- <Alt + E>
        M.map('n', '´', '<nop>')
        M.map('n', '<C-S-E>', '<nop>')
        M.map('n', '<C-S-K>', '<nop>')

        -- <Alt + E>
        M.map('n', '´', ':NvimTreeFocus<CR>')
        M.map('n', '<C-S-E>', ':NvimTreeOpen<CR>')
        M.map('n', '<C-S-K>', ':NvimTreeClose<CR>')

    else
        M.unmap('n', '<C-S-K>')
        M.unmap('n', '´')
        M.unmap('n', '<C-S-E>')
    end
end

Mode.new('DEBUG', debugToggleFn)
Mode.new('LSP', lspToggleFn)
Mode.new('FILES', filesToggleFn)

return M
