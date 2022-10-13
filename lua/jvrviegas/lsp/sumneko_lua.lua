-- Lua Configs
local USER = vim.fn.expand("$USER")

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

local settings = {
	Lua = {
		diagnostics = {
			globals = {
				"vim",
				"use",
				"describe",
				"it",
				"assert",
				"before_each",
				"after_each",
			},
		},
		completion = {
			showWord = "Disable",
			callSnippet = "Disable",
			keywordSnippet = "Disable",
		},
		workspace = {
			checkThirdParty = false,
			library = {
				["${3rd}/love2d/library"] = true,
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			},
		},
	},
}

local M = {}

M.setup = function(on_attach, capabilities)
	local luadev = require("lua-dev").setup({
		lspconfig = {
			on_attach = on_attach,
			cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
			settings = settings,
			flags = {
				debounce_text_changes = 150,
			},
			capabilities = capabilities,
		},
	})
	require("lspconfig").sumneko_lua.setup(luadev)
end

return M

--[[ nvim_lsp.sumneko_lua.setup({
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
}) ]]
