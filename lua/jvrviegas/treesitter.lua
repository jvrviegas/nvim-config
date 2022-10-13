local configs = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

configs.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	autopais = {
		enable = true,
	},
	ensure_installed = {
		"tsx",
		"typescript",
		"json",
		"html",
		"scss",
		"css",
		"javascript",
	},
	context_commentstring = {
		enable = true,
	},
})

local parser_config = parsers.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
