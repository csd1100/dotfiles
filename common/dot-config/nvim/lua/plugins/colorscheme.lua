return {
  {
    'EdenEast/nightfox.nvim',
    commit = '26b61b1f856ec37cae3cb64f5690adb955f246a1',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('carbonfox')
    end,
  },
  {
    'loctvl842/monokai-pro.nvim',
    commit = 'a68e38b8e55d69a215d0f02598900a79c356da9d',
    priority = 1000,
    opts = {
      filter = 'spectrum',
      transparent_background = false,
      background_clear = {
        'float_win',
        'which-key',
        'notify',
      },
    },
    init = function()
      -- vim.cmd.colorscheme('monokai-pro')
    end,
  },
}
