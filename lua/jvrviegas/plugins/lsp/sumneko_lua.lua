-- Lua Configs

local settings = {
  Lua = {
    diagnostics = {
      globals = {
        "vim",
      },
    },
    completion = {
      callSnippet = "Replace",
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file("", true),
    },
  },
}

local M = {}

M.setup = function(on_attach, capabilities)
  local neodev = require("neodev").setup({
    lspconfig = {
      on_attach = on_attach,
      settings = settings,
      capabilities = capabilities,
    },
  })
  require("lspconfig")['sumneko_lua'].setup(neodev)
end

return M
