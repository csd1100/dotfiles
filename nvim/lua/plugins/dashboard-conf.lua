local g = vim.g
g.dashboard_default_executive ='telescope'
 
g.dashboard_custom_section={
    a_new_file = {
        description = {" Open New File              SPC b b"},
        command = "DashboardNewFile"
    },
    b_file_tree = {
        description = {"ﱮ Open File Explorer         SPC b b"},
        command = "NvimTreeOpen"
    },
    c_recents = {
        description = {" Open Recent File           SPC b b"},
        command = "DashboardFindHistory"
    },
    d_color_schemes = {
        description = {" Change Colorscheme         SPC b b"},
        command = "DashboardChangeColorscheme"
    },
    e_vim_game = {
        description = {" Improve your vim-game      SPC b b"},
        command = "VimBeGood"
    }
}

g.dashboard_custom_footer = {

}

g.dashboard_custom_header = {
'                ⠀⣿⣶           ⣰⠣⣿      ',
'                 ⣿⣿⣧⢻⣿⣶⣷⣿⣿⣿⣿⣿⣿⠿⠶⡝⠀    ',
'                 ⠘⣿⣿⣿⢏⣿⣿⣋⣀⣈⣻⣿⣿⣷⣤⣤⣿    ',
'                  ⢩⣝⣫⣾⣿⣿⣿⣿⡟⠿⠿⠦⠀⠸⠿⣻⣿⡄  ',
'                   ⢻⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⠇  ',
'                    ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏   ',
'                    ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏    ',
'                ⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀   ',
'                                                      ',
'███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
'████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
'██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
'██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
'██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
'╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
