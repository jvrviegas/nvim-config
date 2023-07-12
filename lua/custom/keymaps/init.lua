local keymap = vim.keymap

-- center the view according to the cursor when scrolling
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- center the view according to the cursor when searching
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- set leader + w to write buffers
keymap.set('n', '<leader>w', ':w<cr>')

-- set leader + q to quit file
keymap.set('n', '<leader>q', ':q<cr>')

-- set leader + r to switch between two most recent buffers
keymap.set('n', '<leader>r', '<C-^>')

-- set leader + c to copy selected to clipboard
keymap.set('v', '<leader>c', '"+y')

-- set leader + v to paste from clipboard
keymap.set('n', '<leader>v', '"+gP')

-- Clear the quickfix list
keymap.set('n', '<leader>cqf', ":call setqflist([], 'r') | cclose<cr>")

-- [[ Vim Fugitive Keymaps ]]
keymap.set('n', '<leader>gs', ':Git<cr>', { desc = "[G]it [S]ummary" })
keymap.set('n', '<leader>ds', ':Gdiffsplit<cr>', { desc = "Git [D]iff [S]plit" })
keymap.set('n', '<leader>gh', ':0Gclog<cr>', { desc = "[G]it [H]istory" })
