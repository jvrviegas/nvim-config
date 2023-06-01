-- require variables
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			'autoload',
			'plugged',
			'.git/.*',
		},
		mappings = {
			i = {
				['<C-x>'] = false,
				['<C-q>'] = actions.send_to_qflist,
			},
		},

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
		},
	},
})

telescope.load_extension('fzf')

local M = {}

M.reload_modules = function()
	-- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
	-- awesome things.
	local lua_dirs = vim.fn.glob('./lua/*', false, true)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, './lua/', '')
		require('plenary.reload').reload_module(dir)
	end
end

M.search_dotfiles = function()
	local config_dir = vim.env.HOME .. '/.config/nvim'
	require('telescope.builtin').find_files({
		prompt_title = '< VimRC >',
		cwd = config_dir,
		hidden = true,
	})
end

M.git_branches = function()
	require('telescope.builtin').git_branches({
		attach_mappings = function(_, map)
			map('i', '<c-d>', actions.git_delete_branch)
			map('n', '<c-d>', actions.git_delete_branch)
			return true
		end,
	})
end

return M
