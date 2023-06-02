local typescript = require('typescript')

local M = {}
M.setup = function(on_attach, capabilities)
	typescript.setup({
		server = {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
			--[[ flags = {
				debounce_text_changes = 150,
			}, ]]
		},
	})
end

return M
