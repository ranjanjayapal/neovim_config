return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use 'gruvbox-community/gruvbox' -- colorscheme
    use 'bluz71/vim-nightfly-guicolors' -- colorscheme

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {'glepnir/dashboard-nvim'}
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'numToStr/Comment.nvim'
    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-surround'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-web-devicons'
end)
