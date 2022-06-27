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
        shortcut = 'SPC f f'
    }, {
        icon = '  ',
        desc = 'File Browser                ',
        action = 'NvimTreeOpen',
        shortcut = 'SPC f b'
    }, {
        icon = '  ',
        desc = 'Recently opened files       ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC f h'
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