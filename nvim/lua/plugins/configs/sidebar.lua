local status, sidebar = pcall(require, 'sidebar-nvim')
if not status then
    vim.notify('failed to load sidebar.', 'error')
    return
end

local conf = {
    hide_statusline = true,
    sections = { "buffers" },
    buffers = {
        icon = "",
        ignored_buffers = {},
        sorting = "name",
        show_numbers = true,
        ignore_not_loaded = true,
        ignore_terminal = true,
    },

}

sidebar.setup(conf)
