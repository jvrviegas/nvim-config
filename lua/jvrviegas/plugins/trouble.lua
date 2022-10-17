local trouble = require("trouble")
local keymap = vim.keymap.set

trouble.setup({
  action_keys = {
    jump = { "o", "tab" },
    jump_close = "<cr>",
  },
})

local opts = { silent = true, noremap = true }
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
