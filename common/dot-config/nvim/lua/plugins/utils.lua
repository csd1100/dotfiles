return {
    {
        'mbbill/undotree',
        keys = {
            {'<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle UndoTree'}
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { },
    }
}
