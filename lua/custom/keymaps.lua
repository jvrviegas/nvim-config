local keymap = vim.keymap

-- center the view according to the cursor when scrolling
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- center the view according to the cursor when searching
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- set leader + c to copy selected to clipboard
keymap.set('v', '<leader>c', '"+y', { desc = "[C]opy to clipboard" })

-- set leader + v to paste from clipboard
keymap.set('n', '<leader>v', '"+gP', { desc = "Paste from clipboard" })

-- [[ Vim Fugitive Keymaps ]]
keymap.set('n', '<leader>gs', ':Git<cr>', { desc = "[G]it [S]ummary" })
keymap.set('n', '<leader>ds', ':Gdiffsplit<cr>', { desc = "Git [D]iff [S]plit" })
keymap.set('n', '<leader>gh', ':0Gclog<cr>', { desc = "[G]it [H]istory" })

-- [[ Vim Diff Keymaps ]]
-- Choose the left side modifications
keymap.set('n', 'gh', '<cmd>diffget //2<cr>')
-- Choose the right side modifications
keymap.set('n', 'gl', '<cmd>diffget //3<cr>')

-- ---------------------
-- --- CUSTOM MACROS ---
-- ---------------------
-- local esc = vim.api.nvim_replace_termcodes('<esc>', true, true, true)
--
-- --[[ vim.ap.nvim_create_autocmd("FileType", {
-- 	group = "JSLogMacro",
-- 	pattern = { "javascript", "typescript" },
-- 	callback = function()
-- 		vim.fn.setreg("l", "yoconsole.log()<80>kl{}<80>kl <80>kl" .. esc .. "pA;" .. esc)
-- 	end,
-- }) ]]
-- vim.fn.setreg("l", "yoconsole.log({ " .. esc .. "pa });" .. esc)
