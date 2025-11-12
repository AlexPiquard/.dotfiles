return {
	-- bottom bar
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			extensions = { "lazy", "fzf" },
			options = {
				disabled_filetypes = { "snacks_terminal" },
			},
		},
	},
}
