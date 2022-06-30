local M = {}

function M.setup()
    local status, telescope = pcall(require, 'telescope')
    if not status then
        print('failed to load ' .. 'telescope')
        return
    end

    telescope.load_extension('projects')
end

return M
