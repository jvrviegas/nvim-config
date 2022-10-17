local status, saga = pcall(require, "lspsaga")
if (not status) then return end

local keymap = vim.keymap.set

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  },
  code_action_lightbulb = {
    enable = false,
  },
}

local opts = { noremap = true, silent = true }
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap("n", "<leader>a", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
