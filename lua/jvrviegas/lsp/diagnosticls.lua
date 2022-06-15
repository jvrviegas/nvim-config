local M = {}
M.setup = function(on_attach)
	require("lspconfig").diagnosticls.setup({
		on_attach = on_attach,
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"typescript",
			"typescriptreact",
			"css",
			"less",
			"scss",
			"markdown",
			"pandoc",
		},
		init_options = {
			linters = {
				eslint = {
					command = "eslint_d",
					rootPatterns = { ".eslintrc.json", "package.json" },
					debounce = 100,
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
					sourceName = "eslint",
					parseJson = {
						errorsRoot = "[0].messages",
						line = "line",
						column = "column",
						endLine = "startLine",
						endColumn = "endColumn",
						message = "[eslint] ${message} (${ruleId})",
						security = "severity",
					},
					securities = {
						[1] = "error",
						[2] = "warning",
					},
				},
			},
			filetypes = {
				javascript = "eslint",
				javascriptreact = "eslint",
				typescript = "eslint",
				typescriptreact = "eslint",
			},
			formatters = {
				eslint = {
					command = "eslint_d",
					args = { "--stdin", "--stdin-filename", "%filename", "--fix-to-stdout" },
					rootPatterns = { ".git" },
				},
				prettier = {
					command = "prettier_d_slim",
					args = { "--stdin-filepath", "%filename" },
				},
			},
			formatFiletypes = {
				css = "prettier",
				javascript = "eslint",
				javascriptreact = "eslint",
				scss = "prettier",
				less = "prettier",
				typescript = "eslint",
				typescriptreact = "eslint",
				json = "prettier",
				markdown = "prettier",
			},
		},
	})
end

return M
