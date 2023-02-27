-- Lua Configs

local settings = {
	Lua = {
		completion = {
			callSnippet = 'Replace',
		},
		workspace = {
			checkThirdParty = false,
			-- library = vim.api.nvim_get_runtime_file('', true),
		},
	},
}

local M = {}

M.setup = function(on_attach, capabilities)
	require('neodev').setup({})
	require('lspconfig')['lua_ls'].setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			on_attach(client, bufnr)
		end,
		settings = settings,
		capabilities = capabilities,
	})
end

return M
