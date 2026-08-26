return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- branch pins the new install API (get_installed/.install); commit pins
    -- the exact revision so `main` moving upstream can't silently change what's cloned
    branch = 'main',
    commit = '8b98b4470eb326f1c7b50dae79f8c963568e5720',
    build = ':TSUpdate',
    config = function()
      local ensure_installed = {
        'bash',
        'c',
        'css',
        'csv',
        'diff',
        'fish',
        'gitcommit',
        'go',
        'html',
        'javascript',
        'json',
        'jsdoc',
        'lua',
        'markdown',
        'python',
        'query',
        'rust',
        'toml',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      }

      local already_installed = require('nvim-treesitter.config').get_installed()
      local parsers_to_install = vim.iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(already_installed, parser)
        end)
        :totable()

      if #parsers_to_install > 0 then
        require('nvim-treesitter').install(parsers_to_install)
      end

      local max_filesize = 100 * 1024
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter_setup', { clear = true }),
        desc = 'Enable treesitter highlighting and indentation',
        callback = function(ev)
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
