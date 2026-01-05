return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		light_style = "day",
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
	config = function ()
		local colorscheme = vim.fn.system("colorscheme")
		if (colorscheme:match("tokyonight") == nil) then
			vim.cmd("colorscheme tokyonight")
		end
		-- TODO: terminal bg color is wrong (only in var) after set-themes (echo -e "\033]11;?\007"), its working after restarting alacritty
	end
}
