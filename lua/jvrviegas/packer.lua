local status, packer = pcall(require, 'packer')

if not status then
	print('Packer is not installed')
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	use({ 'rmehri01/onenord.nvim', branch = 'main' })
	use({
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' },
	})

	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	})
	use({
		'ggandor/leap.nvim',
		requires = { 'tpope/vim-repeat' },
	})

	-- Variables
	use('nvim-lua/plenary.nvim')
	use('kyazdani42/nvim-tree.lua')
	use('nvim-telescope/telescope.nvim')
	use('nvim-telescope/telescope-fzy-native.nvim')
	use('editorconfig/editorconfig-vim')
	use({ 'mg979/vim-visual-multi', branch = 'master' })
	use('tpope/vim-fugitive')
	use('windwp/nvim-autopairs')
	use('windwp/nvim-ts-autotag')
	use('lewis6991/gitsigns.nvim')
	use('APZelos/blamer.nvim')
	use('lukas-reineke/indent-blankline.nvim')
	use('numToStr/Comment.nvim')
	use('folke/trouble.nvim')
	use('akinsho/toggleterm.nvim')
	use('norcalli/nvim-colorizer.lua')
	use('tpope/vim-unimpaired')

	-- Treesitter
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use('JoosepAlviste/nvim-ts-context-commentstring')

	-- Icons
	use('ryanoasis/vim-devicons')
	use('kyazdani42/nvim-web-devicons')

	-- Themes
	use('ellisonleao/gruvbox.nvim')
	-- Plug 'dracula/vim', {'as': 'dracula'}
	-- Plug 'morhetz/gruvbox'
	-- Plug 'arcticicestudio/nord-vim'
	-- Plug 'yonlu/omni.vim'
	use('folke/tokyonight.nvim')
	-- Plug 'one-dark/onedark.nvim'

	-- Syntax Plugins
	use({ 'styled-components/vim-styled-components', branch = 'main' })

	-- Completion Plugins
	use('neovim/nvim-lspconfig')
	use('ms-jpq/coq_nvim', { branch = 'coq' })

	-- Snippets
	use('ms-jpq/coq.artifacts', { branch = 'artifacts' })

	-- LSP Plugins
	use('jose-elias-alvarez/typescript.nvim')
	use('folke/neodev.nvim')
	use('onsails/lspkind-nvim')
	use('arkav/lualine-lsp-progress')
	use('jose-elias-alvarez/null-ls.nvim')
	use('jose-elias-alvarez/nvim-lsp-ts-utils')
	use('glepnir/lspsaga.nvim') -- LSP UIs
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
end)
