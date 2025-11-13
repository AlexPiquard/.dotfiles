return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>ws", "<cmd>AutoSession search<CR>", desc = "Session search" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "/" },
		bypass_save_filetypes = { "snacks_dashboard" },
	},
}
