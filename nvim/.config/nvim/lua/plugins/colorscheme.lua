vim.opt.termguicolors = true
vim.opt.background = "dark"

return {
    {
        "sonph/onehalf",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
            -- vim.cmd.colorscheme("onehalfdark")
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                color_overrides = {
                    mocha = {
                    },
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
