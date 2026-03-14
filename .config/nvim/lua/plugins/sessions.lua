return {
	"rmagatti/auto-session",
	cmd = "AutoSession",
	keys = {
		{ "<leader>ws", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>wd", "<cmd>AutoSession delete<CR>", desc = "Session delete" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "/" },
		-- no save at all when there is only a dashboard
		bypass_save_filetypes = { "snacks_dashboard" },
		-- exclude theses filetypes when saving
		close_filetypes_on_save = { "checkhealth", "opencode_output" },
	},
}
