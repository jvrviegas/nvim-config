-- Lua Configs

local settings = {
  Lua = {
    diagnostics = {
      globals = {
        "vim",
      },
    },
    completion = {
      showWord = "Disable",
      callSnippet = "Disable",
      keywordSnippet = "Disable",
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file("", true),
    },
  },
}

local M = {}

M.setup = function(on_attach, capabilities)
  local luadev = require("lua-dev").setup({
    lspconfig = {
      on_attach = on_attach,
      settings = settings,
      capabilities = capabilities,
    },
  })
  require("lspconfig").sumneko_lua.setup(luadev)
end

return M
