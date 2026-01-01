-- list of tabs at top
return {
	"nanozuki/tabby.nvim",
	lazy = false,
	config = function()
		---@type TabbyConfig
		require("tabby").setup({
			preset = "active_wins_at_tail",
		})
	end,
}
