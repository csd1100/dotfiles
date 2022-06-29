local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Comment Toggle --
map('n', '<leader>/', ':CommentToggle<CR>')

-- NvimTree splkey: f --
map('n', '<leader>ft', ':NvimTreeToggle<CR>')
map('n', '<leader>ff', ':NvimTreeFocus<CR>')
map('n', '<leader>fo', ':NvimTreeOpen<CR>')

--- Tabs splkey: t --
map('n', '<leader>tt', ':tabnew<CR>')
map('n', '<leader>tp', ':tabprevious<CR>')
map('n', '<leader>tn', ':tabnext<CR>')
map('n', '<leader>te', ':tabedit')

-- Global splkey: g --
map('n', '<leader>gc', ':Telescope colorscheme<CR>')
map('n', '<leader>gh', ':Telescope oldfiles<CR>')
map('n', '<leader>gn', ':DashboardNewFile<CR>')
-- Added this mapping temporarily as test requires tree-sitter parsers installed
-- And on 1st setup startup fails if not installed
map('n', '<leader>get', ':lua require("plugins.configs.test").setup()<CR>')

-- lsp diagnostic splkey: l --
map('n', '<leader>lo', 'vim.diagnostic.open_float')
map('n', '<leader>l<up>', 'vim.diagnostic.goto_prev')
map('n', '<leader>l<down>', 'vim.diagnostic.goto_next')
map('n', '<leader>lq', 'vim.diagnostic.setloclist')

-- dap splkey: d --
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>ds', ':lua require"dap".continue()<CR>')
map('n', '<leader>do', ':lua require"dap".step_over()<CR>')
map('n', '<leader>di', ':lua require"dap".step_into()<CR>')
map('n', '<leader>dot', ':lua require"dap".step_out()<CR>')

-- markdown preview --
map('n', '<leader>mdp', ':Glow<CR>')
