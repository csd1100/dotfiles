local utilsModule = require('basic.keymaps-utils')
local map = utilsModule.map
local unmap = utilsModule.unmap
local Mode = utilsModule.getModeClass()

-- Comment Toggle --
map('n', '<leader>/', ':CommentToggle<CR>')
map('v', '<leader>/', ":'<,'>CommentToggle<CR>")

-- NvimTree splkey: f --
map('n', '<leader><S-f>', ':NvimTreeFocus<CR>')
map('n', '<C-S-E>', ':NvimTreeOpen<CR>')
map('n', '<C-S-K>', ':NvimTreeClose<CR>')

-- Global splkey: g --
map('n', '<leader>cs', ':Telescope colorscheme<CR>')
map('n', '<leader>h', ':Telescope oldfiles<CR>')
map('n', '<leader><leader>', ':Telescope find_files find_command=rg,--ignore,--hidden,--no-ignore-vcs,-g,!.git,--files prompt_prefix=🔍 <CR>')
map('n', '<leader>b', ':lua require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })<CR>')
map('n', '<leader>gp', ':Telescope projects<CR>')
map('n', '<leader>gss', ':SessionSave<CR>')
map('n', '<leader>gsl', ':SessionLoad<CR>')
map('n', '<C-S-n>', ':DashboardNewFile<CR>')
map('n', '<C-S-f>', ':Telescope live_grep<CR>')

-- lsp diagnostic splkey: l --
map('n', '<leader>lo', 'vim.diagnostic.open_float')
map('n', '<leader>l<up>', 'vim.diagnostic.goto_prev')
map('n', '<leader>l<down>', 'vim.diagnostic.goto_next')
map('n', '<leader>lq', 'vim.diagnostic.setloclist')
map('n', '<leader>li', ':lua require("lspconfigs.nvim-lsp-installer-conf").lsp_setup(\'')

-- dap splkey: d --
local debugToggleFn = function(self)
    if self.value then
        map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
        map('n', '<leader><S-d>', ':lua require"dap".continue()<CR>')
        map('n', '<leader><down>', ':lua require"dap".step_over()<CR>')
        map('n', '<leader><right>', ':lua require"dap".step_into()<CR>')
        map('n', '<leader><left>', ':lua require"dap".step_out()<CR>')
    else
        unmap('n', '<leader>b')
        unmap('n', '<leader><S-d>')
        unmap('n', '<leader><down>')
        unmap('n', '<leader><right>')
        unmap('n', '<leader><left>')
    end
end

Mode.new('DEBUG', debugToggleFn)
map('n', '<leader>d', ":lua require('basic.keymaps-utils').Modes.DEBUG:toggle()<CR>")
-- markdown preview --
map('n', '<leader>mdp', ':Glow<CR>')

-- ToggleTerm --
map('n', '<C-S-t>', '<Esc>:ToggleTerm size=10 direction=float <CR>')
