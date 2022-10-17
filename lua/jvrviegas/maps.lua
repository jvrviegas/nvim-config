local keymap = vim.keymap

vim.g.mapleader = " "

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Remap <C-c> to Esc so LSP can work properly when exiting insert mode with <C-c>
keymap.set("i", "<C-c>", "<Esc>")

-- set leader + ev to open nvim config file
keymap.set("n", "<leader>ev", ":vsplit ~/.config/nvim/init.lua<cr>")

-- set leader + sv to source nvim config
keymap.set("n", "<leader>0", ":source ~/.config/nvim/init.lua<cr>")

-- set leader + A to insert at the end of the line
keymap.set("n", "<leader>aa", "A")

-- set leader + w to write buffers
keymap.set("n", "<leader>w", ":w<cr>")

-- set leader + q to quit file
keymap.set("n", "<leader>q", ":q<cr>")

-- set leader + sl to insert new line below with 2 spaces above
keymap.set("n", "<leader>nlb", "o<esc>o")

-- set leader + semicolons to add semicolons at the end
keymap.set("n", "<leader>;", "A;<esc>")

-- set leader + x to cut selected to clipboard
keymap.set("v", "<leader>x", '"+x')

-- set leader + c to copy selected to clipboard
keymap.set("v", "<leader>c", '"+y')

-- set leader + v to paste from clipboard
keymap.set("n", "<leader>v", '"+gP')

-- set keys to copy line and paste above or below
keymap.set("n", "<leader>J", "yyp")
keymap.set("n", "<leader>K", "yyP")

-- Vim Telescope shortcuts
-- Find files using Telescope command-line sugar.
keymap.set("n", "<C-p>", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>")
keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>")
keymap.set("n", "<leader>fbc", "<cmd>Telescope git_bcommits<cr>")

-- Vim Fugitive shortcuts
keymap.set("n", "<leader>gs", ":Git<cr>")
keymap.set("n", "<leader>ds", ":Gdiffsplit<cr>")
keymap.set("n", "<leader>gh", "<c-w>v:0Git log<cr>")

-- NvimTree
keymap.set("n", "<leader>s", ':lua require("nvim-tree").toggle(false, true)<CR>')
keymap.set("n", "<leader>mn", ":NERDTreeMirror<CR>")
keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>")
