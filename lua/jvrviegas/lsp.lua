local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local border_opts = { border = "single", focusable = false, scope = "line" }

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

vim.diagnostic.config({
	float = border_opts,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border_opts)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)

--[[ vim.fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", texthl = "LspDiagnosticsDefaultHint" }) ]]

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

nvim_lsp.tsserver.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Lua Configs
USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
	sumneko_root_path = "/Users/" .. USER .. "/.config/ls/lua-language-server"
	sumneko_binary = "/Users/" .. USER .. "/.config/ls/lua-language-server/bin/lua-language-server"
elseif vim.fn.has("unix") == 1 then
	sumneko_root_path = "/home/" .. USER .. "/.config/ls/lua-language-server"
	sumneko_binary = "/home/" .. USER .. "/.config/ls/lua-language-server/bin/Linux/lua-language-server"
else
	print("Unsupported system for sumneko")
end

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				enable = true,
				globals = {
					"global",
					"vim",
					"use",
					"describe",
					"it",
					"assert",
					"before_each",
					"after_each",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

local diagnostics_code_template = "[#{s}] #{m} (#{c})"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

null_ls.setup({
	sources = {
		-- formatting
		formatting.prettierd.with({
			condition = function(utils)
				return utils.root_has_file({ "prettier.config.js", ".prettierrc", ".prettierrc.json" })
			end,
		}),
		formatting.stylua,
		-- diagnostics
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js" })
			end,
		}),
		diagnostics.luacheck,
		diagnostics.shellcheck.with({
			diagnostics_format = diagnostics_code_template,
		}),
		-- code actions
		code_actions.eslint_d,
		code_actions.gitsigns,
		code_actions.gitrebase,
		-- hover
		hover.dictionary,
	},
	on_attach = on_attach,
})
