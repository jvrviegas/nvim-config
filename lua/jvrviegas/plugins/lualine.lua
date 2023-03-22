local lualine = require('lualine')

local options = {
	theme = 'rose-pine',
}

local sections = {
	lualine_a = { 'mode' },
	lualine_b = { 'branch', 'diff', 'diagnostics' },
	lualine_c = { { 'filename', path = 1 }, 'lsp_progress' },
	lualine_x = { "os.data('%a')", 'data', 'encoding', 'fileformat', 'filetype' },
	lualine_y = { 'progress' },
	lualine_z = { 'location' },
}

lualine.setup({
	options = options,
	sections = sections,
})
