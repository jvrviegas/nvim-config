local nvim_lsp = require("lspconfig")

--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "»",
            spacing = 4,
        },
        signs = true,
        update_in_insert = false,
        severity_sort = true
    }
)]]

local border_opts = { border = "single", focusable = false, scope = "line" }
vim.diagnostic.config({
	float = border_opts,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border_opts)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", texthl = "LspDiagnosticsDefaultHint" })

-- Mapping Opts
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local buf_map = function(bufnr, mode, lhs, rhs, opts)
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
		silent = true,
		noremap = true,
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Commands
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspDeclaration lua vim.lsp.buf.declaration()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	vim.cmd("command! LspLocList lua vim.diagnostic.setloclist()")
	vim.cmd("command! LspNextHunk lua require('gitsigns').next_hunk()")
	vim.cmd("command! LspPrevHunk lua require('gitsigns').prev_hunk()")
	vim.cmd("command! LspPreviewHunk lua require('gitsigns').preview_hunk()")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_map(bufnr, "n", "gD", ":LspDeclaration<CR>")
	buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	buf_map(bufnr, "n", "K", ":LspHover<CR>")
	buf_map(bufnr, "n", "gi", ":LspImplementation<CR>")
	buf_map(bufnr, "n", "gr", ":LspRefs<CR>")
	buf_map(bufnr, "n", "grn", ":LspRename<CR>")
	buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	buf_map(bufnr, "n", "<C-k>", ":LspSignatureHelp<CR>")
	buf_map(bufnr, "n", "<space>rn", ":LspRename<CR>")
	buf_map(bufnr, "n", "<space>ca", ":LspCodeAction<CR>")
	buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
	buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
	buf_map(bufnr, "n", "<space>a", ":LspDiagLine<CR>")
	buf_map(bufnr, "n", "<space>l", ":LspLocList<CR>")
	buf_map(bufnr, "n", "]h", ":LspNextHunk<CR>")
	buf_map(bufnr, "n", "[h", ":LspPrevHunk<CR>")
	buf_map(bufnr, "n", "<leader>hp", ":LspPreviewHunk<CR>")

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, server in ipairs({
	"null-ls",
	"sumneko_lua",
	"tsserver",
}) do
	require("jvrviegas.lsp." .. server).setup(on_attach, capabilities)
end