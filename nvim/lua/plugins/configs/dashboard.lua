local cmd = vim.cmd
local M = {}

function M.setup()
    local status, db = pcall(require, 'dashboard')
    if not status then
        print('failed to load ' .. 'dashboard')
        return
    end

    db.custom_header = { [[              ⣴⠖⠒⠶⣦⠤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀*⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀+⠀             ]],
        [[           *  ⡇⠀⣠⠞⠁⢀⡔⠋⢋⠟⢲⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  +          ]],
        [[              ⢿⠞⠁⢀⡴⠋⠀⠀⠀⠀⠉⠀⢟⡷⣄⡀⠀⠀⠀⠀⠀*⠀⠀⠀⠀⠀⠀⠀⠀⠀             ]],
        [[     *        ⢸⡄⣠⠎⠀⢠⢾⣿⣝⢷⡀⠀⠀⠀⠩⣻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             ]],
        [[         +    ⠀⢿⠃⠀⠀⢾⢺⣿⣿⣯⠇⠀⠀⠀⠀⠁⠞⣳⣤⠤⠤⠤⢤⣄⣀⡀⠀⠀⠀⠀⠀     *       ]],
        [[              ⠀⠘⣧⠂⠀⠈⠳⠿⠿⠋⣠⣶⣶⣦⡀⠀⠐⡡⢻⣦⠤⠤⠤⠤⠤⠉⣳⡄⠀⠀⠀             ]],
        [[  +    *      ⠀⠀⠹⣏⠀⠀⠀⠀⠀⠀⡇⣿⣿⣏⡇⠀⠀⣠⠏⠙⣆⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀             ]],
        [[              ⠀+⠀⠙⣖⠴⡂⠀⠀⠀⠙⠯⠿⠞⠁⢀⡞⠁⢠⠾⢿⡆⠀⠀⠀⠀⠀⠘⣇⠀⠀ +           ]],
        [[           *  ⠀⠀⠀⠀⠘⢿⣔⡠⢀⠀⠀⠀⠀⠀⡴⢻⡶⣴⣃⠀⢐⡿⠒⠒⠒⢦⡀⠀⢻⠀⠀             ]],
        [[  *           ⠀⠀⠀⠀⠀⠀⠙⢶⣥⢂⠀⠀⣠⠎⠀⡰⢷⡀⠉⠛⣟⠁⠀⠀⠀⠀⠙⢦⣸⡆⠀             ]],
        [[         *    ⠀⠀⠀⠀⠀⠀⠀⠀⢿⢻⣦⣞⡁⡠⢊⠀⠀⣷⣄⣀⠹⣗⠶⣄⡀⠀⠀⠈⠻⡇⠀      *      ]],
        [[              ⠀⠀*⠀⠀⠀⠀⠀⢸⠀⡇⠈⠉⠛⠿⢷⡞⠁⠈⢿⠻⣿⠗⣌⠻⣦⡀⠀⠀⠀⠀             ]],
        [[    +         ⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⢧⠀⠀⠀⠀⠘⡇⠀⠀⠈⢷⣌⠳⣌⠳⡈⠻⣄⠀⠀⠀             ]],
        [[        *     ⠀⠀⠀⠀⠀⠀+⠀⠀⢷⢸⡀⠀⠀⠀⠀⠳⣄⠀⠀⠀⠙⠷⣄⡙⠻⠄⠹⣆⠀⠀     +       ]],
        [[           +   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢧⣄⣀⠀⠀⠀⠘⢷⣄⠀⠀⠀⠈⠛⠶⣄⣀⠘⣆⠀             ]],
        [[              +⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠓⠒⠒⠛⠃⠀⠀⠀⠀⠀⠀⠉⠛⠾⠆             ]],
        [[]] }

    db.custom_center = { {
        icon = '  ',
        desc = 'New  File                       ',
        action = 'DashboardNewFile',
        shortcut = 'SPC g n  '
    }, {
        icon = '  ',
        desc = 'File Browser                    ',
        action = 'NvimTreeOpen',
        shortcut = 'SPC f o  '
    }, {
        icon = '  ',
        desc = 'Recently opened files           ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC g h  '
    }, {
        icon = '  ',
        desc = 'Load Last Session               ',
        action = 'SessionLoad',
        shortcut = 'SPC g s l'
    }, {
        icon = '  ',
        desc = 'Open Projects                   ',
        action = 'Telescope projects',
        shortcut = 'SPC g p  '
    } }

    db.custom_footer = { '',
        '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝' }

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
