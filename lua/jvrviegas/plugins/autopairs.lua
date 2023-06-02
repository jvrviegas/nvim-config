local autopairs = require('nvim-autopairs')

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { 'string', 'source' },
		javascript = { 'string', 'template_string' },
	},
	fast_wrap = {
		map = '<M-e>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
		offset = 0, -- Offset from pattern match
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = 'PmenuSel',
		highlight_grey = 'LineNr',
	},
})
