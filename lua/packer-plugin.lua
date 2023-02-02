return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use 'gruvbox-community/gruvbox' -- colorscheme
    use 'bluz71/vim-nightfly-guicolors' -- colorscheme
    -- Install without configuration
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }) -- colorscheme
    use 'tomasiser/vim-code-dark' -- colorscheme
    use "olimorris/onedarkpro.nvim" -- colorscheme

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
          -- config
        }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
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
    use 'numToStr/Comment.nvim'
    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-surround'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-web-devicons'

    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- managing and installing LSP servers
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'

    -- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use "Raimondi/delimitMate"
    use "xiyaowong/nvim-transparent"
    -- use "luk400/vim-jukit"
    use "tpope/vim-fugitive"
    use "airblade/vim-gitgutter"
end)
