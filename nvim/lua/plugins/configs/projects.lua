local status, telescope = pcall(require, 'telescope')
if not status then
    print('failed to load ' .. 'telescope')
    return
end

local status, ntree = pcall(require, 'nvim-tree')
if not status then
    print('failed to load ' .. 'nvim-tree')
    return
end

ntree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
})
telescope.load_extension('projects')
