local lspconfig = require('lspconfig')

local M = {}
M.setup = function(on_attach, capabilities)
	lspconfig.cssls.setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
	})
end

return M
