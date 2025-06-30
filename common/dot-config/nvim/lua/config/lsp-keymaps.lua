return {
  ['n'] = {
    ['K'] = {
      ['rhs'] = function()
        vim.lsp.buf.hover({ border = ui_borders })
      end,
      ['opts'] = { desc = 'Hover Info' },
    },
    ['gd'] = {
      ['rhs'] = vim.lsp.buf.definition,
      ['opts'] = { desc = 'Go To Definition' },
    },
    ['gD'] = {
      ['rhs'] = vim.lsp.buf.declaration,
      ['opts'] = { desc = 'Go To Declaration' },
    },
    ['gi'] = {
      ['rhs'] = vim.lsp.buf.implementation,
      ['opts'] = { desc = 'Go To Implementation' },
    },
    ['gt'] = {
      ['rhs'] = vim.lsp.buf.type_definition,
      ['opts'] = { desc = 'Go To Type Definition' },
    },
    ['gr'] = {
      ['rhs'] = vim.lsp.buf.references,
      ['opts'] = { desc = 'Go To References' },
    },
    ['gs'] = {
      ['rhs'] = function()
        vim.lsp.buf.signature_help({ border = ui_borders })
      end,
      ['opts'] = { desc = 'Go To Signature Help' },
    },
    ['<C-e>n'] = {
      ['rhs'] = vim.lsp.buf.rename,
      ['opts'] = { desc = 'Rename' },
    },
    ['<A-S-f>f'] = {
      ['rhs'] = '<cmd>Format<CR>',
      ['opts'] = { desc = 'Format' },
    },
    ['<C-q>'] = {
      ['rhs'] = vim.lsp.buf.code_action,
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
      ['rhs'] = vim.lsp.buf.format,
      ['opts'] = { desc = 'Format Selection' },
    },
  },
}
