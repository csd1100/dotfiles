return {
    {
        'nkakouros-original/numbers.nvim',
        event = 'InsertEnter',
        config = true,
    },
    {
        'thirtythreeforty/lessspace.vim',
        event = 'InsertEnter',
        init = function()
            vim.g.lessspace_blacklist = { 'markdown' }
        end,
    },
}
