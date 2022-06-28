local M = {}

function M.setup()
    local db = require('dashboard')

    db.custom_header = {[[                                    .--.      ]],
                        [[              +   /\               / /  `     ]],
                        [[ +              .'  '.   *        | |         ]],
                        [[        *      /======\      +     \ \__,     ]],
                        [[              ;:.  _   ;        +   '--'  *   ]],
                        [[              |:. (_)  |                      ]],
                        [[              |:.  _   |                      ]],
                        [[    +         |:. (_)  |         *            ]],
                        [[              ;:.      ;                      ]],
                        [[            .' \:.    / `.                    ]],
                        [[           / .-'':._.'`-. \                   ]],
                        [[           |/    /||\    \|                   ]],
                        [[         _..--"""````"""--.._                 ]],
                        [[   _.-'``                    ``'-._           ]],
                        [[ -'                                '-         ]], [[]]}

    db.custom_center = {{
        icon = '  ',
        desc = 'New  File                   ',
        action = 'DashboardNewFile',
        shortcut = 'SPC g n'
    }, {
        icon = '  ',
        desc = 'File Browser                ',
        action = 'NvimTreeOpen',
        shortcut = 'SPC f o'
    }, {
        icon = '  ',
        desc = 'Recently opened files       ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC g h'
    }}

    db.custom_footer = {'',
                        '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                        '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                        '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                        '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                        '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                        '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                        ''}

end

return M