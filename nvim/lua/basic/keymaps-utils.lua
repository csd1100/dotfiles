local M = {}

M.Modes = {}

function M.getModeClass()
    local Mode = {
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

    return Mode
end

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
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.unmap(mode, lhs)
    vim.api.nvim_del_keymap(mode, lhs)
end

local debugToggleFn = function(self)
    if self.value then
        M.map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
        M.map('n', '<leader><S-d>', ':lua require"dap".continue()<CR>')
        M.map('n', '<leader><down>', ':lua require"dap".step_over()<CR>')
        M.map('n', '<leader><right>', ':lua require"dap".step_into()<CR>')
        M.map('n', '<leader><left>', ':lua require"dap".step_out()<CR>')
    else
        M.unmap('n', '<leader>b')
        M.unmap('n', '<leader><S-d>')
        M.unmap('n', '<leader><down>')
        M.unmap('n', '<leader><right>')
        M.unmap('n', '<leader><left>')
    end
end

local completionToggleFn = function(self)
    if self.value then
        -- add brackets and quotes in visual mode
        M.map('v', '"', [[<ESC>`>a"<ESC>`<i"<ESC>]])
        M.map('v', "'", [[<ESC>`>a'<ESC>`<i'<ESC>]])
        M.map('v', '(', [[<ESC>`>a)<ESC>`<i(<ESC>]])
        M.map('v', '[', [[<ESC>`>a]<ESC>`<i[<ESC>]])
        M.map('v', '{', [[<ESC>`>a}<ESC>`<i{<ESC>]])
        M.map('v', '<', [[<ESC>`>a><ESC>`<i<<ESC>]])
        M.map('i', '"', '""<left>')
        M.map('i', '\'', '\'\'<left>')
        M.map('i', '(', '()<left>')
        M.map('i', '[', '[]<left>')
        M.map('i', '{', '{}<left>')
        M.map('i', '<', '<><left>')
        M.map('i', '{<CR>', '{<CR>}<ESC>O')
    else
        M.unmap('v', '"')
        M.unmap('v', "'")
        M.unmap('v', '(')
        M.unmap('v', '[')
        M.unmap('v', '{')
        M.unmap('v', '<')
        M.unmap('i', '"')
        M.unmap('i', "'")
        M.unmap('i', '(')
        M.unmap('i', '[')
        M.unmap('i', '{')
        M.unmap('i', '<')
        M.unmap('i', '{<CR>')
    end
end

local Mode = M.getModeClass()
Mode.new('DEBUG', debugToggleFn)
local COMPL = Mode.new('COMPL', completionToggleFn)
-- enable quotes completion by default --
COMPL:toggle()

return M
