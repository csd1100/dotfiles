-- packer config --
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- dashboard --
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
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- plugins that use tree-sitter --
    -- open links in markdown files --
    use 'jghauser/follow-md-links.nvim'

    -- spell-check --
    use 'lewis6991/spellsitter.nvim'

    -- regex explainer -- 
    use 'bennypowers/nvim-regexplainer'
    use 'MunifTanjim/nui.nvim'

    -- markdown preview --
    use {
        'ellisonleao/glow.nvim',
        branch = 'main'
    }

    -- commentor --
    use 'terrortylor/nvim-comment'

    -- vim be good --
    use 'ThePrimeagen/vim-be-good'
end)