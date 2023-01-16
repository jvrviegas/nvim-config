local status, lspsaga = pcall(require, 'lspsaga')
if not status then
	return
end

local statusLazy, lazy = pcall(require, 'lazy')
if not statusLazy then
	return
end

lazy.setup({
	lspsaga,
	event = 'BufRead',
	config = function()
		lspsaga.setup({})
	end,
})
