local function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

-- packer config --
vim.cmd 'autocmd BufWritePost plugin_specification.lua source <afile> | PackerSync'
return if_successful('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    -- fast loading plugins --
    use { 'lewis6991/impatient.nvim' }

    -- dashboard --
    use { 'glepnir/dashboard-nvim' }

    -- fzf telescope --
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- project management --
    use { 'ahmedkhalf/project.nvim' }

    -- lua line --
    use { 'nvim-lualine/lualine.nvim' }

    -- cursor line --
    use { 'yamatsum/nvim-cursorline' }

    -- tab line --
    use { 'nanozuki/tabby.nvim' }

    -- indent line --
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- file tree --
    use { 'kyazdani42/nvim-tree.lua' }

    -- icons --
    use { 'kyazdani42/nvim-web-devicons' }

    -- git --
    use { 'lewis6991/gitsigns.nvim' }

    -- colorizer --
    use { 'norcalli/nvim-colorizer.lua' }

    -- create dirs when saving if not present --
    use { 'jghauser/mkdir.nvim' }

    -- clean trailing white-spaces --
    use { 'mcauley-penney/tidy.nvim' }

    -- colorschemes --
    use { 'tanvirtin/monokai.nvim' }
    use { 'sainnhe/everforest' }
    use { 'sainnhe/sonokai' }
    use { 'frenzyexists/aquarium-vim' }
    use { 'sts10/vim-pink-moon' }
    use { 'morhetz/gruvbox' }
    -- disable relative numbers when in insert mode --
    use { 'nkakouros-original/numbers.nvim' }

    -- treesitter syntax highlight --
    use { 'nvim-treesitter/nvim-treesitter' }

    -- spell-check --
    use { 'lewis6991/spellsitter.nvim' }

    -- regex explainer --
    use { 'bennypowers/nvim-regexplainer' }
    use { 'MunifTanjim/nui.nvim' }

    -- markdown preview --
    use { 'ellisonleao/glow.nvim', ft = 'markdown' }

    -- commentor --
    use { 'terrortylor/nvim-comment' }

    -- lsp --
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'hrsh7th/nvim-cmp' } -- Autocompletion plugin
    use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source for nvim-cmp
    use { 'hrsh7th/cmp-vsnip' } -- LSP source for nvim-cmp
    use { 'hrsh7th/cmp-path' } -- LSP source for nvim-cmp
    use { 'hrsh7th/cmp-buffer' } -- LSP source for nvim-cmp
    use { 'saadparwaiz1/cmp_luasnip' } -- Snippets source for nvim-cmp
    use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
    use { 'sbdchd/neoformat' } -- Formatting plugin --
    use { 'mfussenegger/nvim-jdtls' }
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }

    -- testing plugin --
    use { 'klen/nvim-test' }

    -- rust lsp conf---
    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

end)
