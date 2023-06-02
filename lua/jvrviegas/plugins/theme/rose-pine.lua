local rosepine = require('rose-pine')

local M = {}
M.setup = function()
	rosepine.setup({
		variant = 'moon',
	})
end

return M
