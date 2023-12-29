local keymap = vim.keymap

-- center the view according to the cursor when scrolling
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- center the view according to the cursor when searching
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- set leader + w to write buffers
keymap.set('n', '<leader>w', ':w<cr>', { desc = "Quick [W]rite" })

-- set leader + q to quit file
keymap.set('n', '<leader>q', ':q<cr>', { desc = "Quick [Q]uit" })

-- set leader + r to switch between two most recent buffers
keymap.set('n', '<leader>r', '<C-^>', { desc = "Switch between two most [R]ecent buffers" })

-- set leader + c to copy selected to clipboard
keymap.set('v', '<leader>c', '"+y', { desc = "[C]opy to clipboard" })

-- set leader + v to paste from clipboard
keymap.set('n', '<leader>v', '"+gP', { desc = "Paste from clipboard" })

-- Clear the quickfix list
keymap.set('n', '<leader>cqf', ":call setqflist([], 'r') | cclose<cr>", { desc = "[C]lear the [Q]uick [F]ix list" })

-- Display the current path relative to the tmux session path
keymap.set('n', '<leader>cd', ":echo fnamemodify(expand('%'), ':~:.')", { desc = "Display [C]urrent [D]irectory path" })

-- [[ Vim Fugitive Keymaps ]]
keymap.set('n', '<leader>gs', ':Git<cr>', { desc = "[G]it [S]ummary" })
keymap.set('n', '<leader>ds', ':Gdiffsplit<cr>', { desc = "Git [D]iff [S]plit" })
keymap.set('n', '<leader>gh', ':0Gclog<cr>', { desc = "[G]it [H]istory" })

-- [[ Vim Diff Keymaps ]]
-- Choose the left side modifications
keymap.set('n', 'gg', '<cmd>diffget //2<cr>')
-- Choose the right side modifications
keymap.set('n', 'gm', '<cmd>diffget //3<cr>')
