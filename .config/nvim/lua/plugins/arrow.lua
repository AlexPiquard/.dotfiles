return {
	-- Bookmark your files, separated by project, and quickly navigate through them.
	"otavioschwanck/arrow.nvim",
	lazy = false,
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		leader_key = ";",
		-- per buffer mappings
		buffer_leader_key = "m",
	},
}
