"Plugins managed by Plug 
set nocompatible              " be iMproved, required

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'windwp/nvim-autopairs'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-ts-autotag'
Plug 'lewis6991/gitsigns.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/trouble.nvim'
Plug 'akinsho/toggleterm.nvim', { 'tag': 'v1.*'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Themes
Plug 'ellisonleao/gruvbox.nvim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
" Plug 'dracula/vim', {'as': 'dracula'}
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'yonlu/omni.vim'
" Plug 'folke/tokyonight.nvim'
" Plug 'one-dark/onedark.nvim'

" Syntax Plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Completion Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Snippets
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp

" LSP Plugins
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'folke/lua-dev.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

call plug#end()            " required
filetype plugin indent on    " required
highlight Normal guibg=none
