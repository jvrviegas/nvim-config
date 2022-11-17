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
  require('lspconfig')['sumneko_lua'].setup({
    on_attach = on_attach,
    settings = settings,
    capabilities = capabilities,
  })
end

return M
