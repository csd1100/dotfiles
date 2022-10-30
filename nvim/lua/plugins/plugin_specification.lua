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
    use {
        'wbthomason/packer.nvim',
        commit = '6afb67460283f0e990d35d229fd38fdc04063e0a'
    }

    -- fast loading plugins --
    use {
        'lewis6991/impatient.nvim',
        commit = 'b842e16ecc1a700f62adb9802f8355b99b52a5a6'
    }

    -- dashboard --
    use {
        'glepnir/dashboard-nvim',
        commit = '1c4802a654c9127c745cbe2ffff9909a3a9ff965'
    }

    -- fzf telescope --
    use {
        'nvim-telescope/telescope.nvim',
        commit = '2584ff391b528d01bf5e8c04206d5902a79ebdde'
    }
    use {
        'nvim-lua/plenary.nvim',
        commit = '4b66054e75356ac0b909bbfee9c682e703f535c2'
    }

    -- project management --
    use {
        'ahmedkhalf/project.nvim',
        commit = '090bb11ee7eb76ebb9d0be1c6060eac4f69a240f'
    }

    -- Sessions Management --
    use {
        'Shatur/neovim-session-manager',
        commit = '4005dac93f5cd1257792259ef4df6af0e3afc213'
    }

    -- lua line --
    use {
        'nvim-lualine/lualine.nvim',
        commit = 'a52f078026b27694d2290e34efa61a6e4a690621'
    }
    -- cursor line --
    use {
        'yamatsum/nvim-cursorline',
        commit = '804f0023692653b2b2368462d67d2a87056947f9'
    }

    -- tab line --
    use {
        'nanozuki/tabby.nvim',
        commit = '916c9e56d043906a441cd9f905e2ca1f5c4dddb0'
    }

    -- indent line --
    use {
        'lukas-reineke/indent-blankline.nvim',
        commit = 'db7cbcb40cc00fc5d6074d7569fb37197705e7f6'
    }

    -- file tree --
    use {
        'kyazdani42/nvim-tree.lua',
        commit = 'fb8735e96cecf004fbefb086ce85371d003c5129'
    }

    -- icons --
    use {
        'kyazdani42/nvim-web-devicons',
        commit = '2d02a56189e2bde11edd4712fea16f08a6656944'
    }

    -- git --
    use {
        'lewis6991/gitsigns.nvim',
        commit = '231fa923fbc2797eef92b24860ab882cebf645b2'
    }

    -- colorizer --
    use {
        'norcalli/nvim-colorizer.lua',
        commit = '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6'
    }

    -- create dirs when saving if not present --
    use {
        'jghauser/mkdir.nvim',
        commit = 'c55d1dee4f099528a1853b28bb28caa802eba217'
    }

    -- clean trailing white-spaces --
    use {
        'mcauley-penney/tidy.nvim',
        commit = '4dcb51102eefa3485957add8d8c8cfa4953718d1'
    }

    -- colorschemes --
    use {
        'tanvirtin/monokai.nvim',
        commit = '4fc970efcbbdcd614733eb8c68d3b8bf8bddec3e'
    }
    use {
        'sainnhe/everforest',
        commit = '765328360ca61f889709c36e68cd44c11a127093'
    }
    use {
        'sainnhe/sonokai',
        commit = '7b0ad56a0aaa12f205b586b143edb8296d3d5821'
    }
    use {
        'sainnhe/gruvbox-material',
        commit = '2807579bd0a9981575dbb518aa65d3206f04ea02'
    }
    use {
        'morhetz/gruvbox',
        commit = 'bf2885a95efdad7bd5e4794dd0213917770d79b7'
    }
    -- disable relative numbers when in insert mode --
    use {
        'nkakouros-original/numbers.nvim',
        commit = '01c50eb6cd66ca61e7009b19a71603cc55768fb1'
    }

    -- treesitter syntax highlight --
    use {
        'nvim-treesitter/nvim-treesitter',
        commit = '088dfbc54abfefeab8d3f1efc8be1ea48888b320'
    }

    -- spell-check --
    use {
        'lewis6991/spellsitter.nvim',
        commit = '4af8640d9d706447e78c13150ef7475ea2c16b30'
    }
    -- regex explainer --
    use {
        'bennypowers/nvim-regexplainer',
        commit = '0d7151ddd3ff2b2e9e8a69137b911c28fc7051a4'
    }
    use {
        'MunifTanjim/nui.nvim',
        commit = 'e9889bbd9919544697d497537acacd9c67d0de99'
    }

    use {
        'akinsho/toggleterm.nvim',
        commit = '2a787c426ef00cb3488c11b14f5dcf892bbd0bda'
    }
    -- markdown preview --
    use {
        'ellisonleao/glow.nvim',
        ft = 'markdown',
        commit = '8dca3583e44d54bcfd79cb8dc06ddb89128aa5e0'
    }

    -- commentor --
    use {
        'terrortylor/nvim-comment',
        commit = 'e9ac16ab056695cad6461173693069ec070d2b23'
    }

    -- lsp --
    use {
        'neovim/nvim-lspconfig',
        commit = '51775b12cfbf1b6462c7b13cd020cc09e6767aea'
    }
    use {
        'williamboman/nvim-lsp-installer',
        commit = 'ae913cb4fd62d7a84fb1582e11f2e15b4d597123'
    }
    use {
        'hrsh7th/nvim-cmp',
        commit = '913eb8599816b0b71fe959693080917d8063b26a'
    } -- Autocompletion plugin
    use {
        'hrsh7th/cmp-nvim-lsp',
        commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8'
    } -- LSP source for nvim-cmp
    use {
        'hrsh7th/cmp-vsnip',
        commit = '0abfa1860f5e095a07c477da940cfcb0d273b700',
        opt = true
    } -- LSP source for nvim-cmp
    use {
        'hrsh7th/cmp-path',
        commit = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1'
    } -- LSP source for nvim-cmp
    use {
        'hrsh7th/cmp-buffer',
        commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa'
    } -- LSP source for nvim-cmp
    use {
        'saadparwaiz1/cmp_luasnip',
        commit = 'a9de941bcbda508d0a45d28ae366bb3f08db2e36'
    } -- Snippets source for nvim-cmp
    use {
        'L3MON4D3/LuaSnip',
        commit = '9bb0d2b2280dccaa14d750c309e487c4e6df696b'
    } -- Snippets plugin
    use {
        'sbdchd/neoformat',
        commit = '0ae951121da29a157d80db70c32679b428afffdc'
    } -- Formatting plugin --
    use {
        'mfussenegger/nvim-jdtls',
        commit = '774a7714f9dcdfaa8d6d86831809ab941b2b7f26'
    } -- java lsp --
    use {
        'mfussenegger/nvim-dap',
        commit = 'd9b315a81622457cddf6875c6ac7134baa9932ce'
    } -- debugger --
    use {
        'rcarriga/nvim-dap-ui',
        commit = 'ebebd429f88bcf656d4c78dec201a8be73a76156'
    } -- debugger ui --
    use {
        'simrat39/rust-tools.nvim',
        commit = '86a2b4e31f504c00715d0dd082a6b8b5d4afbf03'
    } -- rust --
    use {
        'Saecki/crates.nvim',
        commit = '003442e2448870f6f2fab6ec7ac7b4de21e6d1d4'
    } -- rust --

    -- testing plugin --
    use {
        'klen/nvim-test',
        commit = '32f162c27045fc712664b9ddbd33d3c550cb2bfc'
    }

    -- Game --
    use {
        'seandewar/killersheep.nvim',
    }
end)