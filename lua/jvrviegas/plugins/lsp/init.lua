vim.diagnostic.config({
	float = {
		source = 'always',
	},
	update_in_insert = true,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = '●' },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = '●',
	},
	update_in_insert = false,
	float = {
		source = 'always', -- Or "if_many"
	},
})

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
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Commands
	vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
	vim.cmd('command! LspDeclaration lua vim.lsp.buf.declaration()')
	vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
	vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
	vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
	vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
	vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
	vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
	vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
	vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
	vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
	vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
	vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
	vim.cmd('command! LspLocList lua vim.diagnostic.setloclist()')
	vim.cmd("command! LspNextHunk lua require('gitsigns').next_hunk()")
	vim.cmd("command! LspPrevHunk lua require('gitsigns').prev_hunk()")
	vim.cmd("command! LspPreviewHunk lua require('gitsigns').preview_hunk()")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- buf_map(bufnr, 'n', 'gD', ':LspDeclaration<CR>')
	buf_map(bufnr, 'n', 'gD', ':LspDef<CR>')
	-- buf_map(bufnr, "n", "K", ":LspHover<CR>")
	buf_map(bufnr, 'n', 'gi', ':LspImplementation<CR>')
	buf_map(bufnr, 'n', 'gf', ':LspRefs<CR>')
	-- buf_map(bufnr, "n", "grn", ":LspRename<CR>")
	-- buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	-- buf_map(bufnr, "n", "<C-k>", ":LspSignatureHelp<CR>")
	-- buf_map(bufnr, "n", "<space>rn", ":LspRename<CR>")
	-- buf_map(bufnr, "n", "<space>ca", ":LspCodeAction<CR>")
	-- buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
	-- buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
	-- buf_map(bufnr, "n", "<space>a", ":LspDiagLine<CR>")
	buf_map(bufnr, 'n', '<space>l', ':LspLocList<CR>')
	buf_map(bufnr, 'n', ']h', ':LspNextHunk<CR>')
	buf_map(bufnr, 'n', '[h', ':LspPrevHunk<CR>')
	buf_map(bufnr, 'n', '<leader>hp', ':LspPreviewHunk<CR>')

	if client.server_capabilities.documentFormattingProvider then
		vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs({
	'null-ls',
	'lua_ls',
	'tsserver',
	'cssls',
	'clangd',
	'rust_analyzer',
}) do
	require('jvrviegas.plugins.lsp.' .. server).setup(on_attach, capabilities)
end
