local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	open_on_setup = true,
	view = {
		side = "left",
		width = 30,
	},
    actions = {
        open_file = {
            resize_window = true,
        }
    }
})
