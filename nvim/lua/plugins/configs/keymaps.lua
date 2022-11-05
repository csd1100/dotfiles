local utilsModule = require('basic.keymaps-utils')
local map = utilsModule.map
local unmap = utilsModule.unmap
local Mode = utilsModule.getModeClass()

-- Comment Toggle --
map('n', '<leader>/', ':CommentToggle<CR>', { desc = 'Comment current Line' })
map('v', '<leader>/', ":'<,'>CommentToggle<CR>", { desc = 'Comment Selection' })

-- NvimTree --
map('n', '<leader><S-f>', ':NvimTreeFocus<CR>', { desc = 'Focus on Files' })
map('n', '<C-S-E>', ':NvimTreeOpen<CR>', { desc = 'Open Files' })

-- SideBar --
map('n', '<C-S-B>', ':SidebarNvimFocus<CR>', { desc = 'Open SideBar' })

-- close all open sidebars --
map('n', '<C-S-K>', ':SidebarNvimClose<CR>|:NvimTreeClose<CR>', { desc = 'Close Sidebars' })

-- Global splkey: g --
map('n', '<leader>cs', ':Telescope colorscheme<CR>', { desc = 'Chnage colorscheme' })
map('n', '<leader>h', ':Telescope oldfiles<CR>', { desc = 'Recent Files' })
map('n', '<leader><leader>',
    ':Telescope find_files find_command=rg,--ignore,--hidden,--no-ignore-vcs,-g,!.git,--files prompt_prefix=🔍 <CR>',
    { desc = 'Find in Files' })
map('n', '<leader>b', ':lua require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })<CR>'
    , { desc = 'List Open Buffers' })
map('n', '<leader>gp', ':Telescope projects<CR>', { desc = 'Projects' })
map('n', '<leader>gss', ':SessionSave<CR>', { desc = 'Save Current Session' })
map('n', '<leader>gsl', ':SessionLoad<CR>', { desc = 'Load Saved Session' })
map('n', '<C-S-n>', ':DashboardNewFile<CR>', { desc = 'New Blank File' })
map('n', '<C-S-f>', ':Telescope live_grep<CR>', { desc = 'Find String in all files' })

-- lsp diagnostic splkey: l --
map('n', '<leader>lo', 'vim.diagnostic.open_float', { desc = 'Open LSP Diagnostics' })
map('n', '<leader>l<up>', 'vim.diagnostic.goto_prev', { desc = 'Go To Previous Diagnostics' })
map('n', '<leader>l<down>', 'vim.diagnostic.goto_next', { desc = 'Go To Next Diagnostics' })
map('n', '<leader>lq', 'vim.diagnostic.setloclist', { desc = '' })
map('n', '<leader>li', ':lua require("lspconfigs.nvim-lsp-installer-conf").lsp_setup(\'', { desc = 'Install LSP and Tree Parser' })

-- dap splkey: d --
local debugToggleFn = function(self)
    if self.value then
        map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle Breakpoint (DEBUG)' })
        map('n', '<leader><S-d>', ':lua require"dap".continue()<CR>', { desc = 'Continue (DEBUG)' })
        map('n', '<leader><down>', ':lua require"dap".step_over()<CR>', { desc = 'Step Over (DEBUG)' })
        map('n', '<leader><right>', ':lua require"dap".step_into()<CR>', { desc = 'Step Into (DEBUG)' })
        map('n', '<leader><left>', ':lua require"dap".step_out()<CR>', { desc = 'Step Out (DEBUG)' })
    else
        unmap('n', '<leader>b')
        unmap('n', '<leader><S-d>')
        unmap('n', '<leader><down>')
        unmap('n', '<leader><right>')
        unmap('n', '<leader><left>')
    end
end

Mode.new('DEBUG', debugToggleFn)
map('n', '<leader>d', ":lua require('basic.keymaps-utils').Modes.DEBUG:toggle()<CR>", { desc = 'Toggle DEBUG Mode' })
-- markdown preview --
map('n', '<leader>mdp', ':Glow<CR>', { desc = 'Markdown Preview using Glow' })

-- ToggleTerm --
map('n', '<C-S-t>', '<Esc>:ToggleTerm size=10 direction=float <CR>', { desc = 'Open Floating Terminal' })
