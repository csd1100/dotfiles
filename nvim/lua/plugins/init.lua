-- packer config --
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
--     -- dashboard --
    use {'glepnir/dashboard-nvim'}

    -- fzf telescope --
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'

    -- lua line --
    use{
        'nvim-lualine/lualine.nvim',
        config = require('plugins/lualine-conf').setup()
    }

    -- cursor line --
    use {
        'yamatsum/nvim-cursorline',
        config = require('plugins/cursorline-conf').setup()
    }

    -- tab line --
    use {
        'nanozuki/tabby.nvim',
        config = require('tabby').setup()
    }

    -- file tree --
    use {
        'kyazdani42/nvim-tree.lua',
        config = require('nvim-tree').setup()
    }

    -- icons -- 
    use 'kyazdani42/nvim-web-devicons'

    -- git blame --
    use 'f-person/git-blame.nvim'

    -- colorizer --
    use {
        'norcalli/nvim-colorizer.lua',
        config = require('colorizer').setup()
    }

    -- create dirs when saving if not present --
    use 'jghauser/mkdir.nvim'

    -- clean trailing white-spaces --
    use {
        'mcauley-penney/tidy.nvim',
        config = require('tidy').setup()
    }

    -- colorschemes --
    use 'tanvirtin/monokai.nvim'
    use 'sainnhe/everforest'
    use 'sainnhe/sonokai'

    -- disable relative numbers when in insert mode --
    use {
        'nkakouros-original/numbers.nvim',
        config = require('numbers').setup()
    }

    -- tree-sitter - tree-sitter is syntax parser kind-of -- 
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('plugins/treesitter-conf').setup()
    }

    -- plugins that use tree-sitter --
    -- open links in markdown files --
    use 'jghauser/follow-md-links.nvim'

    -- spell-check --
    use {
        'lewis6991/spellsitter.nvim',
        config = require('spellsitter').setup()
    }

    -- regex explainer --
    use {
        'bennypowers/nvim-regexplainer',
        config = require('regexplainer').setup()
    }
    use 'MunifTanjim/nui.nvim'

    -- markdown preview --
    use {
        'ellisonleao/glow.nvim',
        branch = 'main'
    }

    -- commentor --
    use {
        'terrortylor/nvim-comment',
        config = require('nvim_comment').setup()
    }

end)
