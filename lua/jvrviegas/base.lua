vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.mouse = ''
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100
vim.opt.inccommand = 'split'

-- always set autoindenting on
vim.opt.autoindent = true

-- good when starting new line
vim.opt.smartindent = true

-- fill tabls with spaces
vim.opt.expandtab = true

-- 2 spaces everywhere please!
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

-- don't wrap lines
vim.opt.wrap = false

-- show line numbers
vim.opt.number = true

-- allow hidden buffers
vim.opt.hidden = true

-- use many undos
vim.opt.undolevels=50

-- SCROLLING
-- ============================================
-- show more lines around cursor when at the edge of file
vim.opt.scrolloff=8
vim.opt.sidescrolloff=8

-- SEARCH
-- ======================================
-- ignore case when searching
vim.opt.ignorecase = true

-- ignore case if search pattern is all lowercase, case-sensitive otherwise
vim.opt.smartcase = true

-- highlight search when typing
vim.opt.incsearch = true

-- highlight search terms
vim.opt.hlsearch = false

-- set cursorline
vim.opt.cursorline = true

-- do not highlight when vim starts
vim.opt.hls = false

vim.opt.timeout = true
vim.opt.timeoutlen = 400
