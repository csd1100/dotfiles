local status, ll = pcall(require, 'lualine')
if not status then
    print('failed to load lualine')
    return
end

local function getCustomModes()
    local modesModule = require('basic.keymaps-utils')
    return modesModule.getActiveModes(modesModule.Modes)
end

local conf = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false
    },
    sections = {
        lualine_a = { 'mode', getCustomModes },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

ll.setup(conf)
