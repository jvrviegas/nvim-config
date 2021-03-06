"Plugins managed by Plug 
set nocompatible              " be iMproved, required

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'preservim/nerdcommenter'
Plug 'b3nj5m1n/kommentary'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'windwp/nvim-ts-autotag'
Plug 'lewis6991/gitsigns.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Themes
" Plug 'dracula/vim', {'as': 'dracula'}
"Plug 'morhetz/gruvbox'
" Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
" Plug 'arcticicestudio/nord-vim'
" Plug 'yonlu/omni.vim'
" Plug 'folke/tokyonight.nvim'
" Plug 'one-dark/onedark.nvim'
"Plug 'nokobear/vim-colorscheme-edit'

" Syntax Plugins
"Plug 'sheerun/vim-polyglot'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Completion Plugins
" Plug 'hrsh7th/nvim-compe'
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
"Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
" Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'arkav/lualine-lsp-progress'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

call plug#end()            " required
filetype plugin indent on    " required
"let g:dracula_colorterm = 0
" let g:gruvbox_italic=1
" set background=dark
colorscheme onenord
highlight Normal guibg=none
