local prettier_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  json = true,
  jsonc = true,
  css = true,
  scss = true,
  less = true,
  html = true,
  yaml = true,
  markdown = true,
  graphql = true,
  vue = true,
}

local prettier_config_markers = {
  '.prettierrc',
  '.prettierrc.json',
  '.prettierrc.yml',
  '.prettierrc.yaml',
  '.prettierrc.js',
  '.prettierrc.cjs',
  '.prettierrc.mjs',
  'prettier.config.js',
  'prettier.config.cjs',
  'prettier.config.mjs',
}

local function project_root(bufnr)
  return vim.fs.root(bufnr, { 'package.json', '.git' }) or vim.fn.getcwd()
end

local function prettier_config_present(root)
  for _, marker in ipairs(prettier_config_markers) do
    if vim.uv.fs_stat(root .. '/' .. marker) then
      return true
    end
  end
  local pkg_json = root .. '/package.json'
  if vim.uv.fs_stat(pkg_json) then
    local ok, decoded = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg_json), '\n'))
    if ok and decoded.prettier then
      return true
    end
  end
  return false
end

local function prettier_runner(root)
  if vim.uv.fs_stat(root .. '/node_modules/.bin/prettier') then
    return { root .. '/node_modules/.bin/prettier' }
  elseif vim.uv.fs_stat(root .. '/pnpm-lock.yaml') then
    return { 'pnpm', 'exec', 'prettier' }
  elseif vim.uv.fs_stat(root .. '/yarn.lock') then
    return { 'yarn', 'prettier' }
  elseif vim.uv.fs_stat(root .. '/bun.lockb') then
    return { 'bunx', 'prettier' }
  end
  return { 'npx', '--yes', 'prettier' }
end

local function format_with_prettier(bufnr, root)
  local cmd = prettier_runner(root)
  table.insert(cmd, '--write')
  table.insert(cmd, vim.api.nvim_buf_get_name(bufnr))
  vim.system(cmd, { cwd = root, text = true }, function(result)
    vim.schedule(function()
      if result.code ~= 0 then
        vim.notify('prettier failed: ' .. (result.stderr or ''), vim.log.levels.ERROR)
        return
      end
      if vim.api.nvim_buf_is_valid(bufnr) then
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('checktime')
        end)
      end
    end)
  end)
end

local function has_client(bufnr, name)
  return #vim.lsp.get_clients({ bufnr = bufnr, name = name }) > 0
end

vim.api.nvim_create_user_command('Format', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype

  if has_client(bufnr, 'biome') then
    vim.lsp.buf.format({ bufnr = bufnr })
    return
  end

  local root = project_root(bufnr)
  if prettier_filetypes[filetype] and prettier_config_present(root) then
    format_with_prettier(bufnr, root)
    return
  end

  if #vim.lsp.get_clients({ bufnr = bufnr, method = 'textDocument/formatting' }) > 0 then
    vim.lsp.buf.format({ bufnr = bufnr })
    return
  end

  vim.notify('No formatter available for filetype: ' .. filetype, vim.log.levels.WARN)
end, { desc = 'Format buffer: biome LSP > prettier CLI > any formatting-capable LSP client' })
