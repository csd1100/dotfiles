local M = {}

function M.setup()
    local status, ts = pcall(require, 'nvim-treesitter.configs')
    if not status then
        print('failed to load ' .. 'nvim-treesitter.configs')
        return
    end

    local conf = {
        ensure_installed = {'bash', 'json', 'markdown', 'yaml', 'lua', 'regex'},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    }

    ts.setup(conf)
end

return M
