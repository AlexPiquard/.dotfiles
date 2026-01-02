return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		-- transparent = true,
		-- styles = {
		-- 	sidebars = "transparent",
		-- 	floats = "transparent",
		-- },
		on_highlights = function(hl, c)
			-- Opencode missing groups
			hl.OpencodeDiffAdd = { bg = c.diff.add }
			hl.OpencodeDiffDelete = { bg = c.diff.delete }
		end,
	},
}
