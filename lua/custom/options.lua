-- [[ Setting custom options ]]

-- Set relative numbers
vim.o.relativenumber = true

-- Set the width of a tab character (number of spaces)
vim.o.tabstop = 4      -- Number of spaces a tab counts for
vim.o.shiftwidth = 4   -- Size of an autoindent
vim.o.expandtab = true -- Use spaces instead of tabs

-- Set splits to open always in the right
vim.opt.splitright = true

-- Set how many lines from the end and top it should start scrolling
vim.opt.scrolloff = 8

-- Configuration for formatting json response on rest.nvim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json" },
	callback = function()
		vim.api.nvim_set_option_value("formatprg", "jq", { scope = 'local' })
	end,
})

-- Set command to open Finder on current working directory
vim.api.nvim_create_user_command('OpenInFinder', function()
	vim.cmd('!open ..')
end, {})
