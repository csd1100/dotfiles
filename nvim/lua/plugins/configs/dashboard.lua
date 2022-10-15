local cmd = vim.cmd
local M = {}

function M.setup()
    local status, db = pcall(require, 'dashboard')
    if not status then
        print('failed to load ' .. 'dashboard')
        return
    end

    db.custom_header = {
        [[]],
        [[]],
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        [[]],
        [[]],
        [[]],
    }

    db.custom_center = { {
        icon = '  ',
        desc = 'Load Last Session               ',
        action = 'SessionLoad<CR>',
        shortcut = 'SPC g s l      '
    }, {
        icon = '  ',
        desc = 'Recently opened files           ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC  h         '
    }, {
        icon = '  ',
        desc = 'Open Projects                   ',
        action = 'Telescope projects',
        shortcut = 'SPC g p        '
    }, {
        icon = '  ',
        desc = 'New  File                       ',
        action = 'DashboardNewFile',
        shortcut = 'Ctrl Shift n   '
    }, {
        icon = '  ',
        desc = 'File Browser                    ',
        action = 'NvimTreeOpen',
        shortcut = 'Ctrl Shift e   '
    }}

    db.custom_footer = {[[]]}
    cmd [[
        highlight DashboardHeader ctermfg=110 guifg=#72cce8
        highlight DashboardCenter ctermfg=107 guifg=#9dd274
        highlight DashboardShortcut ctermfg=203 guifg=#ff6578
        highlight DashboardFooter ctermfg=179 guifg=#eacb64
    ]]

    -- session mgmt --
    local home = os.getenv('HOME')
    if not home then
        home = vim.fn.getcwd()
    end

    local session_dir = os.getenv('NVIM_SESSIONS_DIR')
    if not session_dir then
        session_dir = home .. '/.nvim/sessions'
    end
    local sessionsfile = session_dir
    db.session_directory = sessionsfile
end

return M
