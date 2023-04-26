local status, lspsaga = pcall(require, 'lspsaga')
if not status then
	return
end

lspsaga.setup({
	lightbulb = {
		enable = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
	},
})
