local status, gitsigns = pcall(require, 'gitsigns')
if not status then
    vim.notify('failed to load gitsigns', 'error')
    return
end

local map = require('basic.keymaps-utils').map

local config = {
    numhl     = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                return ']c'
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, {
            expr = true
        })

        map('n', '[c', function()
            if vim.wo.diff then
                return '[c'
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, {
            expr = true
        })

    end
}

gitsigns.setup(config)
