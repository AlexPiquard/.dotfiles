return {
	{
		"windwp/nvim-ts-autotag",
		event = "User FilePost",
        opts = {}
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		event = "User FilePost",
	},
	{
		-- adds css colors
		"norcalli/nvim-colorizer.lua",
		event = "User FilePost",
		config = function()
			require("colorizer").setup();
		end,
	},
}
