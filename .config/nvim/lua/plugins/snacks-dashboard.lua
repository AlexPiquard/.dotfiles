return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.config
	opts = {
		---@class snacks.dashboard.config
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "recent files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{ pane = 2, icon = " ", title = "projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "git status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
}
