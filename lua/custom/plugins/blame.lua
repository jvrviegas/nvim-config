return {
  "f-person/git-blame.nvim",
  -- Optional dependency
  init = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_delay = 500
    vim.keymap.set("n", "<leader>b", ":GitBlameToggle<cr>", { desc = "Git [B]lame Toggle" })
  end,
  config = function()
    vim.cmd([[ GitBlameDisable ]])
  end
}
