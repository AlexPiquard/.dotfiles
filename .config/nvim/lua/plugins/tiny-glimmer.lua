return {
	-- adds smooth, customizable animations to text operations like yank, paste, search, undo/redo, and more.
	-- TODO: adapt to theme reload
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
