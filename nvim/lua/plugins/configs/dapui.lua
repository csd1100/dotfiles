local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

local M = {}

function M.setup()
    local dap = if_successful('dap')
    local dapui = if_successful('dapui')

    local config = {
        icons = {
            expanded = '▾',
            collapsed = '▸'
        },
        mappings = {
            expand = {'<CR>', '<2-LeftMouse>'},
            open = 'o',
            remove = 'd',
            edit = 'e',
            repl = 'r',
            toggle = 't'
        },
        expand_lines = vim.fn.has('nvim-0.7'),
        layouts = {{
            elements = {{
                id = 'scopes',
                size = 0.25
            }, 'breakpoints', 'stacks', 'watches'},
            size = 40, -- 40 columns
            position = 'left'
        }, {
            elements = {'repl', 'console'},
            size = 0.25, -- 25% of total lines
            position = 'bottom'
        }},
        floating = {
            max_height = nil,
            max_width = nil, 
            border = 'single',
            mappings = {
                close = {'q', '<Esc>'}
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

end

return M
