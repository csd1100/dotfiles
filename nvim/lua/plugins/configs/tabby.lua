local status, tt = pcall(require, 'tabby.tabline')
if not status then
    vim.notify('failed to load tabby.tabline', 'error')
    return
end

local status, util = pcall(require, 'tabby.util')
if not status then
    vim.notify('failed to load tabby.util', 'error')
    return
end

local hl_tabline = util.extract_nvim_hl('TabLine')
local hl_tabline_fill = util.extract_nvim_hl('TabLineFill')
local hl_tabline_sel = util.extract_nvim_hl('TabLineSel')

local function tab_label(tabid, active)
    local icon = active and '' or ''
    local number = vim.api.nvim_tabpage_get_number(tabid)
    local name = util.get_tab_name(tabid)
    return string.format(' %s %d: %s ', icon, number, name)
end

local theme = {
    fill = hl_tabline_fill,
    head = hl_tabline,
    current_tab = hl_tabline_sel,
    tab = hl_tabline,
    win = hl_tabline,
    tail = hl_tabline
}
tt.set(function(line)
    return {
        {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep('', hl, theme.fill),
                tab.is_current() and '' or '',
                tab.number(),
                tab.name(),
                tab.close_btn(''),
                line.sep('', hl, theme.fill),
                hl = hl,
                margin = ' ',
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep('', theme.win, theme.fill),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep('', theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
            }
        end),
        {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
        },
        hl = theme.fill,
    }

end)
