-- packer config --
vim.cmd 'autocmd BufWritePost plugin_specification.lua source <afile> | PackerCompile'
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    --     -- dashboard --
    use 'glepnir/dashboard-nvim'

    -- fzf telescope --
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'

    -- lua line --
    use 'nvim-lualine/lualine.nvim'

    -- cursor line --
    use 'yamatsum/nvim-cursorline'

    -- tab line --
    use 'nanozuki/tabby.nvim'

    -- indent line --
    use 'lukas-reineke/indent-blankline.nvim'

    -- file tree --
    use 'kyazdani42/nvim-tree.lua'

    -- icons --
    use 'kyazdani42/nvim-web-devicons'

    -- git blame --
    use 'f-person/git-blame.nvim'

    -- colorizer --
    use 'norcalli/nvim-colorizer.lua'

    -- create dirs when saving if not present --
    use 'jghauser/mkdir.nvim'

    -- clean trailing white-spaces --
    use 'mcauley-penney/tidy.nvim'

    -- colorschemes --
    use 'tanvirtin/monokai.nvim'
    use 'sainnhe/everforest'
    use 'sainnhe/sonokai'

    -- disable relative numbers when in insert mode --
    use 'nkakouros-original/numbers.nvim'

    -- tree-sitter - tree-sitter is syntax parser kind-of --
    use 'nvim-treesitter/nvim-treesitter'

    -- plugins that use tree-sitter --
    -- open links in markdown files --
    use 'jghauser/follow-md-links.nvim'

    -- spell-check --
    use 'lewis6991/spellsitter.nvim'

    -- regex explainer --
    use 'bennypowers/nvim-regexplainer'

    use 'MunifTanjim/nui.nvim'

    -- markdown preview --
    use 'ellisonleao/glow.nvim'

    -- commentor --
    use 'terrortylor/nvim-comment'

    -- lsp --
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'udalov/kotlin-vim'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'sbdchd/neoformat' -- Formatting plugin --

    -- testing plugin --
    use 'klen/nvim-test'
end)
