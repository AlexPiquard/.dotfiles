return {
	-- apply neovim indent config from what file already contains (tab, spaces, etc)
	"NMAC427/guess-indent.nvim",
	lazy = false,
	opts = {
		on_tab_options = {
			["tabstop"] = 4,
			["shiftwidth"] = 4,
			["softtabstop"] = 4,
		},
	},
}
