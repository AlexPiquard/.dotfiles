return {
	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = {
			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		},
	},
}
