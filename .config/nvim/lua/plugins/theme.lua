return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			on_highlights = function(hl, c)
				local Util = require("tokyonight.util")
				hl.BufferAlternateADDED = { bg = c.fg_gutter, fg = c.git.add }
				hl.BufferAlternateCHANGED = { bg = c.fg_gutter, fg = c.git.change }
				hl.BufferAlternateDELETED = { bg = c.fg_gutter, fg = c.git.delete }
				hl.BufferCurrentADDED = { bg = c.bg, fg = c.git.add }
				hl.BufferCurrentCHANGED = { bg = c.bg, fg = c.git.change }
				hl.BufferCurrentDELETED = { bg = c.bg, fg = c.git.delete }
				hl.BufferInactiveADDED = { bg = Util.blend_bg(c.bg_highlight, 0.4), fg = Util.blend_bg(c.git.add, 0.8) }
				hl.BufferInactiveCHANGED = { bg = Util.blend_bg(c.bg_highlight, 0.4), fg = Util.blend_bg(c.git.change, 0.8) }
				hl.BufferInactiveDELETED = { bg = Util.blend_bg(c.bg_highlight, 0.4), fg = Util.blend_bg(c.git.delete, 0.8) }
				hl.BufferVisibleADDED = { bg = c.bg_statusline, fg = c.git.add }
				hl.BufferVisibleCHANGED = { bg = c.bg_statusline, fg = c.git.change }
				hl.BufferVisibleDELETED = { bg = c.bg_statusline, fg = c.git.delete }
			end,
			-- transparent = true,
			-- styles = {
			-- 	sidebars = "transparent",
			-- 	floats = "transparent",
			-- },
		},
	},
}
