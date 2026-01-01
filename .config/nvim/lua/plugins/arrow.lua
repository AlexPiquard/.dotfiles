return {
	-- Bookmark your files, separated by project, and quickly navigate through them.
	"otavioschwanck/arrow.nvim",
	lazy = false,
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		leader_key = "<leader>b", -- TODO: find another key (one key)
		-- per buffer mappings
		buffer_leader_key = "m",
		-- TODO: use letters to select instead of numbers
	},
}
