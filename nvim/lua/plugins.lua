local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Some random stuff
    use 'sheerun/vim-polyglot'
    use 'mbbill/undotree'
    use 'unblevable/quick-scope'
    use 'ap/vim-css-color'
    use 'tpope/vim-commentary'
    use 'mattn/emmet-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    -- Color schemes
    use 'morhetz/gruvbox'
    use 'NLKNguyen/papercolor-theme'
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/nord.nvim'
    use 'jacoborus/tender.vim'
    use 'jnurmine/Zenburn'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use "saadparwaiz1/cmp_luasnip"

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP config
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end)
