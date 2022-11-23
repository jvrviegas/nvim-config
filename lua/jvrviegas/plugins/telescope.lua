-- require variables
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'-u',
		},
		prompt_prefix = '> ',
		selection_caret = '> ',
		entry_prefix = '  ',
		initial_mode = 'insert',
		selection_strategy = 'reset',
		sorting_strategy = 'descending',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require('telescope.sorters').get_fuzzy_sorter,
		file_ignore_patterns = {
			'*/tmp/*',
			'coverage',
			'lib',
			'build',
			'/build/.*',
			'/dist/.*',
			'/lib/.*',
			'*/build/*',
			'*/lib/*',
			'*/dist/*',
			'node_modules',
			'*.so',
			'*.swp',
			'*.zip',
			'autoload',
			'plugged',
			'.DS_Store',
			'.git/.*',
		},
		generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
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
		fzy_native = {
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
		},
	},
})

telescope.load_extension('fzy_native')

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
