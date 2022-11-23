local null_ls = require('null-ls')

local diagnostics_code_template = '[#{s}] #{m} (#{c})'
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local sources = {
	-- formatting
	formatting.eslint_d,
	formatting.stylua,
	-- diagnostics
	diagnostics.eslint_d.with({
		diagnostics_format = diagnostics_code_template,
		condition = function(utils)
			return utils.root_has_file({ '.eslintrc.json', '.eslintrc.js' })
		end,
	}),
	diagnostics.luacheck.with({
		diagnostics_format = diagnostics_code_template,
	}),
	-- code actions
	code_actions.eslint_d,
	code_actions.gitsigns,
	code_actions.gitrebase,
	-- hover
	hover.dictionary,
}

local M = {}
M.setup = function(on_attach)
	if not vim.g.started_by_firenvim then
		null_ls.setup({
			-- debug = true,
			sources = sources,
			on_attach = on_attach,
		})
	end
end

return M
