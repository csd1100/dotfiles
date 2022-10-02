local utilsModule = require('basic.keymaps-utils')
local map = utilsModule.map

-- Comment Toggle --
map('n', '<leader>/', ':CommentToggle<CR>')

-- NvimTree splkey: f --
map('n', '<leader><S-f>', ':NvimTreeFocus<CR>')
map('n', '<C-S-E>', ':NvimTreeOpen<CR>')
map('n', '<C-S-K>', ':NvimTreeClose<CR>')

-- Global splkey: g --
map('n', '<leader>gc', ':Telescope colorscheme<CR>')
map('n', '<leader>gh', ':Telescope oldfiles<CR>')
map('n', '<leader>gb', ':Telescope buffers<CR>')
map('n', '<leader>gp', ':Telescope projects<CR>')
map('n', '<leader>gn', ':DashboardNewFile<CR>')
map('n', '<leader>gss', ':SessionSave<CR>')
map('n', '<leader>gsl', ':SessionLoad<CR>')
-- Added this mapping temporarily as test requires tree-sitter parsers installed
-- And on 1st setup startup fails if not installed
map('n', '<leader>get', ':lua require("plugins.configs.test").setup()<CR>')

-- lsp diagnostic splkey: l --
map('n', '<leader>lo', 'vim.diagnostic.open_float')
map('n', '<leader>l<up>', 'vim.diagnostic.goto_prev')
map('n', '<leader>l<down>', 'vim.diagnostic.goto_next')
map('n', '<leader>lq', 'vim.diagnostic.setloclist')

-- dap splkey: d --
map('n', '<leader>d', ":lua require('basic.keymaps-utils').Modes.DEBUG:toggle()<CR>")

-- markdown preview --
map('n', '<leader>mdp', ':Glow<CR>')
