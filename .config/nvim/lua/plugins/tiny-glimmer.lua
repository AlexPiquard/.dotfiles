return {
	-- adds smooth, customizable animations to text operations like yank, paste, search, undo/redo, and more.
	"rachartier/tiny-glimmer.nvim",
	event = "BufReadPost",
	opts = {
		overwrite = {
			search = {
				enabled = true,
			},
			undo = {
				enabled = true,
			},
			redo = {
				enabled = true,
			},
		},
	},
}
