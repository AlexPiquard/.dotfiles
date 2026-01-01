return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>ws", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>wd", "<cmd>AutoSession delete<CR>", desc = "Session delete" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "/" },
		bypass_save_filetypes = { "snacks_dashboard" },
	},
}
