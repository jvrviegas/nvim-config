return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      -- add any options here
      lsp = {
        documentation = {
          view = "hover",
          opts = { -- lsp_docs settings
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            position = { row = 2, col = 2 },
            size = {
              max_width = math.floor(0.8 * vim.api.nvim_win_get_width(0)),
              max_height = 15,
            },
            border = {
              style = "rounded",
            },
            win_options = {
              concealcursor = "n",
              conceallevel = 3,
              winhighlight = {
                Normal = "CmpPmenu",
                FloatBorder = "DiagnosticSignInfo",
              },
            },
          }
        },
      },
      routes = {
        {
          view = "notify",
          filter = {
            event = "notify",
            message = "No information available"
          },
          opts = {
            skip = true
          }
        },
      },
    })
    require("notify").setup({
      background_colour = "#000000"
    })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
