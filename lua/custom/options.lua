-- [[ Setting custom options ]]

-- Set custom diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Set relative numbers
vim.o.relativenumber = true

-- Set splits to open always in the right
vim.opt.splitright = true

-- Set how many lines from the end and top it should start scrolling
vim.opt.scrolloff = 8
