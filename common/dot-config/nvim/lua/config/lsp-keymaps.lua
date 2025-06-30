return {
  ['n'] = {
    ['K'] = {
      ['rhs'] = function()
        vim.lsp.buf.hover({ border = ui_borders })
      end,
      ['opts'] = { desc = 'Hover Info' },
    },
    ['gd'] = {
      ['rhs'] = function()
        vim.lsp.buf.definition()
      end,
      ['opts'] = { desc = 'Go To Definition' },
    },
    ['gD'] = {
      ['rhs'] = function()
        vim.lsp.buf.declaration()
      end,
      ['opts'] = { desc = 'Go To Declaration' },
    },
    ['gi'] = {
      ['rhs'] = function()
        vim.lsp.buf.implementation()
      end,
      ['opts'] = { desc = 'Go To Implementation' },
    },
    ['gt'] = {
      ['rhs'] = function()
        vim.lsp.buf.type_definition()
      end,
      ['opts'] = { desc = 'Go To Type Definition' },
    },
    ['gr'] = {
      ['rhs'] = function()
        vim.lsp.buf.references()
      end,
      ['opts'] = { desc = 'Go To References' },
    },
    ['gs'] = {
      ['rhs'] = function()
        vim.lsp.buf.signature_help({ border = ui_borders })
      end,
      ['opts'] = { desc = 'Go To Signature Help' },
    },
    ['<C-e>n'] = {
      ['rhs'] = function()
        vim.lsp.buf.rename()
      end,
      ['opts'] = { desc = 'Rename' },
    },
    ['<A-S-f>f'] = {
      ['rhs'] = '<cmd>Format<CR>',
      ['opts'] = { desc = 'Format' },
    },
    ['<C-q>'] = {
      ['rhs'] = function()
        vim.lsp.buf.code_action()
      end,
      ['opts'] = { desc = 'Code Actions' },
    },
    ['t]'] = {
      ['rhs'] = function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
      ['opts'] = { desc = 'Go to Next Diagnostic Message' },
    },
    ['t['] = {
      ['rhs'] = function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
      ['opts'] = { desc = 'Go to Previous Diagnostic Message' },
    },
    ['Q'] = {
      ['rhs'] = function()
        vim.diagnostic.open_float()
      end,
      ['opts'] = { desc = 'Show Diagnostic Message' },
    },
  },
  ['x'] = {
    ['<A-S-f>l'] = {
      ['rhs'] = function()
        vim.lsp.buf.format()
      end,
      ['opts'] = { desc = 'Format Selection' },
    },
  },
}
