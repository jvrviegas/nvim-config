local keymap = vim.keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Remap <C-c> to Esc so LSP can work properly when exiting insert mode with <C-c>
keymap.set('i', '<C-c>', '<Esc>')

-- set leader + ev to open nvim config file
keymap.set('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<cr>')

-- set leader + sv to source nvim config
keymap.set('n', '<leader>0', ':source ~/.config/nvim/init.lua<cr>')

-- set leader + A to insert at the end of the line
keymap.set('n', '<leader>aa', 'A')

-- set leader + w to write buffers
keymap.set('n', '<leader>w', ':w<cr>')

-- set leader + q to quit file
keymap.set('n', '<leader>q', ':q<cr>')

-- set leader + sl to insert new line below with 2 spaces above
keymap.set('n', '<leader>nlb', 'o<esc>o')

-- set leader + semicolons to add semicolons at the end
keymap.set('n', '<leader>;', 'A;<esc>')

-- set leader + x to cut selected to clipboard
keymap.set('v', '<leader>x', '"+x')

-- set leader + c to copy selected to clipboard
keymap.set('v', '<leader>c', '"+y')

-- set leader + v to paste from clipboard
keymap.set('n', '<leader>v', '"+gP')

-- set keys to copy line and paste above or below
keymap.set('n', '<leader>J', 'yyp')
keymap.set('n', '<leader>K', 'yyP')

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- set keys to move tabs left and right
keymap.set('n', '<A-Left>', '<cmd>-tabmove<cr>')
keymap.set('n', '<A-Right>', '<cmd>+tabmove<cr>')

keymap.set('n', '<leader>>', ':exe "vertical resize " . (winwidth(0) * 3/2)<CR>', opts)
keymap.set('n', '<leader><', ':exe "vertical resize " . (winwidth(0) * 2/3)<CR>', opts)
keymap.set('n', '<leader>+', ':exe "resize " . (winheight(0) * 3/2)<CR>', opts)
keymap.set('n', '<leader>-', ':exe "resize " . (winheight(0) * 2/3)<CR>', opts)

-- Vim Telescope shortcuts
-- Find files using Telescope command-line sugar.
keymap.set('n', '<C-p>', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>')
keymap.set('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>')
keymap.set('n', '<leader>fbc', '<cmd>Telescope git_bcommits<cr>')
keymap.set('n', '<leader>vrc', function()
	require('jvrviegas.plugins.telescope').search_dotfiles()
end)
keymap.set('n', '<leader>gc', function()
	require('jvrviegas.plugins.telescope').git_branches()
end)

-- Vim Fugitive shortcuts
keymap.set('n', '<leader>gs', ':Git<cr>')
keymap.set('n', '<leader>ds', ':Gdiffsplit<cr>')
keymap.set('n', '<leader>gh', '<c-w>v:0Git log<cr>')

-- NvimTree
keymap.set('n', '<leader>s', ':lua require("nvim-tree").toggle(false, true)<CR>')
keymap.set('n', '<leader>mn', ':NERDTreeMirror<CR>')
keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>')

-- LspSaga
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('n', '<leader>a', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Blamer
keymap.set('n', '<leader>gb', ':BlamerToggle<cr>')

-- Trouble
keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
keymap.set('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
keymap.set('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', opts)
keymap.set('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
keymap.set('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
