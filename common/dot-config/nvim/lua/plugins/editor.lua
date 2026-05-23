local ku = require('config.keymap-utils')
return {
  {
    'thirtythreeforty/lessspace.vim',
    commit = '2f3e60d79501026b78b593e8a12749ef1220dd61',
    event = 'InsertEnter',
    init = function()
      vim.g.lessspace_blacklist = { 'markdown' }
    end,
  },
  {
    'numToStr/Comment.nvim',
    commit = 'e30b7f2008e52442154b66f7c519bfd2f1e32acb',
    event = { 'BufEnter' },
    keys = { '<C-/>' },
    opts = {
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = '<C-/>',
        ---Block-comment toggle keymap
        block = '<C-S-/>',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<C-/>',
        ---Block-comment keymap
        block = '<C-S-/>',
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
    },
  },
}
