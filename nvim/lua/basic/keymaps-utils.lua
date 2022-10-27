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

local completionToggleFn = function(self)
    if self.value then
        -- add brackets and quotes in visual mode
        M.map('v', '"', [[<ESC>`>a"<ESC>`<i"<ESC>]])
        M.map('v', "'", [[<ESC>`>a'<ESC>`<i'<ESC>]])
        M.map('v', "`", [[<ESC>`>a`<ESC>`<i`<ESC>]])
        M.map('v', '(', [[<ESC>`>a)<ESC>`<i(<ESC>]])
        M.map('v', '[', [[<ESC>`>a]<ESC>`<i[<ESC>]])
        M.map('v', '{', [[<ESC>`>a}<ESC>`<i{<ESC>]])
        M.map('i', '"', '""<left>')
        M.map('i', "'", '\'\'<left>')
        M.map('i', '`', '``<left>')
        M.map('i', '\'', '\'\'<left>')
        M.map('i', '(', '()<left>')
        M.map('i', '[', '[]<left>')
        M.map('i', '{', '{}<left>')
        M.map('i', '<', '<><left>')
        M.map('i', '{<CR>', '{<CR>}<ESC>O')
    else
        M.unmap('v', '"')
        M.unmap('v', '`')
        M.unmap('v', "'")
        M.unmap('v', '(')
        M.unmap('v', '[')
        M.unmap('v', '{')
        M.unmap('i', '"')
        M.unmap('i', '`')
        M.unmap('i', "'")
        M.unmap('i', '(')
        M.unmap('i', '[')
        M.unmap('i', '{')
        M.unmap('i', '<')
        M.unmap('i', '{<CR>')
    end
end

local Mode = M.getModeClass()
local COMPL = Mode.new('COMPL', completionToggleFn)
-- enable quotes completion by default --
COMPL:toggle()

return M
