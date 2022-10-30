local status, dap = pcall(require, 'dap')
if not status then
    print('failed to load dap')
    return
end

local status, dapui = pcall(require, 'dapui')
if not status then
    print('failed to load dapui')
    return
end

local config = {
    icons = {
        expanded = '▾',
        collapsed = '▸'
    },
    mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't'
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = { {
        elements = { {
            id = 'scopes',
            size = 0.25
        }, 'watches' },
        size = 40, -- 40 columns
        position = 'left'
    }, {
        elements = { 'console' },
        size = 0.25, -- 25% of total lines
        position = 'bottom'
    } },
    floating = {
        max_height = nil,
        max_width = nil,
        border = 'single',
        mappings = {
            close = { 'q', '<Esc>' }
        }
    },
    windows = {
        indent = 1
    },
    render = {
        max_type_length = nil -- Can be integer or nil.
    }
}

dapui.setup(config)

vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = '',
    numhl = ''
})

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end
