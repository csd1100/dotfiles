local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("failed to load dashboard", "error")
	return
end

local cmd = vim.cmd

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

db.custom_center = {
	{
		icon = "  ",
		desc = "Load Last Session               ",
		action = "RestoreSession",
		shortcut = "SPC g s l      ",
	},
	{
		icon = "  ",
		desc = "Recently opened files           ",
		action = "Telescope oldfiles",
		shortcut = "SPC  h         ",
	},
	{
		icon = "  ",
		desc = "Open Projects                   ",
		action = "Telescope projects",
		shortcut = "SPC g p        ",
	},
	{
		icon = "  ",
		desc = "New  File                       ",
		action = "DashboardNewFile",
		shortcut = "Ctrl Shift n   ",
	},
	{
		icon = "  ",
		desc = "File Browser                    ",
		action = "NvimTreeOpen",
		shortcut = "Ctrl Shift e   ",
	},
}

db.custom_footer = { [[]] }
cmd([[
        highlight DashboardHeader ctermfg=110 guifg=#72cce8
        highlight DashboardCenter ctermfg=107 guifg=#9dd274
        highlight DashboardShortcut ctermfg=203 guifg=#ff6578
        highlight DashboardFooter ctermfg=179 guifg=#eacb64
    ]])