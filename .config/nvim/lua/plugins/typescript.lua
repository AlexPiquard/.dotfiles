return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "typescript", "typescriptreact", "html" },
		opts = {},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = { "typescript", "typescriptreact" },
	},
	-- {
	-- 	-- adds css colors
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	event = "User FilePost",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- },
	{
		-- Highlights all color codes
		"brenoprata10/nvim-highlight-colors",
		event = "User FilePost",
		opts = {},
	},
}
