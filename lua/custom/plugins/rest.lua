return {
  "rest-nvim/rest.nvim",
  config = function()
    vim.keymap.set("n", "<leader><cr>", "<cmd>Rest run<CR>", { desc = "Run rest command" })
  end
}

