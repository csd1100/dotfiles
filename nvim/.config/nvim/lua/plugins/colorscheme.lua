vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.cmd.colorscheme("moonfly")
        end,
    },
    {
        "sonph/onehalf",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            vim.cmd.colorscheme("onehalfdark")
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            require("onedark").setup({
                style = "warm",
            })
            require("onedark").load()
        end,
    },
}
