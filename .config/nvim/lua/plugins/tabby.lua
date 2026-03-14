return {
	-- list of tabs at top
	"nanozuki/tabby.nvim",
	event = "BufReadPost",
	config = function()
		---@type TabbyConfig
		require("tabby").setup({
			preset = "active_wins_at_tail",
		})
	end,
}
