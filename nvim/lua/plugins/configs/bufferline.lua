local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("failed to load bufferline.", "error")
	return
end

local conf = {
	options = {
		mode = "tabs",
		numbers = "ordinal",
		show_tab_indicators = true,
		sort_by = "tabs",
		enforce_regular_tabs = true,
		separator_style = "thin",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
			{
				filetype = "SidebarNvim",
				text = "Sidebar",
				text_align = "left",
				separator = true,
			},
		},
	},
}

bufferline.setup(conf)
