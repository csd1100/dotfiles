local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
end

local M = {}

function M.setup()
    local status, gitsigns = pcall(require, 'gitsigns')
    if not status then
        print('failed to load ' .. 'gitsigns')
        return
    end

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

            -- git splkey: v --
            map({ 'n', 'v' }, '<leader>vs', ':Gitsigns stage_hunk<CR>')
            map({ 'n', 'v' }, '<leader>vr', ':Gitsigns reset_hunk<CR>')
            map('n', '<leader>vS', gs.stage_buffer)
            map('n', '<leader>vu', gs.undo_stage_hunk)
            map('n', '<leader>vR', gs.reset_buffer)
            map('n', '<leader>vp', gs.preview_hunk)
            map('n', '<leader>vb', function()
                gs.blame_line {
                    full = true
                }
            end)
            map('n', '<leader>vlb', gs.toggle_current_line_blame)
            map('n', '<leader>vd', gs.diffthis)
            map('n', '<leader>vD', function()
                gs.diffthis('~')
            end)
            map('n', '<leader>vdd', gs.toggle_deleted)

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    }

    gitsigns.setup(config)
end

return M
