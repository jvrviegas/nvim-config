local nvim_tree = require('nvim-tree')

nvim_tree.setup({
	view = {
		side = 'left',
		width = 30,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
})

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
