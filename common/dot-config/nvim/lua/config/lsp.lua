local ku = require('config.keymap-utils')
local modes = require('modes')

modes.create_if_not_present('LSP', function() end, function() end, '{}')
modes.add_maps('LSP', require('config.lsp-keymaps'))

ku.map('i', '<C-Space>', function()
  vim.lsp.completion.get()
end, { desc = 'Trigger LSP Completion' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.name ~= 'rust_analyzer' then
      modes.enable_mode('LSP', { buffer = ev.buf })
    end
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      format = {
        enable = true,
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
        },
      },
    },
  },
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

vim.lsp.config('biome', {
  cmd = { 'biome', 'lsp-proxy' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'jsonc',
  },
  root_markers = { 'biome.json', 'biome.jsonc' },
})

vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs'
  },
  workspace_required = true,
  settings = {
    workingDirectory = { mode = 'auto' },
  },
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
})

vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json' },
})

vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'auto',
    linters = { 'rubocop' },
  },
})

vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'biome',
  'eslint',
  'gopls',
  'rust_analyzer',
  'ruby_lsp',
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
  -- update_in_insert = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})
