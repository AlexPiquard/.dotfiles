-- theme colors:
-- bg = "#222436",
-- bg_dark = "#1e2030",
-- bg_dark1 = "#191B29",
-- bg_highlight = "#2f334d",
-- blue = "#82aaff",
-- blue0 = "#3e68d7",
-- blue1 = "#65bcff",
-- blue2 = "#0db9d7",
-- blue5 = "#89ddff",
-- blue6 = "#b4f9f8",
-- blue7 = "#394b70",
-- comment = "#636da6",
-- cyan = "#86e1fc",
-- dark3 = "#545c7e",
-- dark5 = "#737aa2",
-- fg = "#c8d3f5",
-- fg_dark = "#828bb8",
-- fg_gutter = "#3b4261",
-- green = "#c3e88d",
-- green1 = "#4fd6be",
-- green2 = "#41a6b5",
-- magenta = "#c099ff",
-- magenta2 = "#ff007c",
-- orange = "#ff966c",
-- purple = "#fca7ea",
-- red = "#ff757f",
-- red1 = "#c53b53",
-- teal = "#4fd6be",
-- terminal_black = "#444a73",
-- yellow = "#ffc777",
-- git = {
--   add = "#b8db87",
--   change = "#7ca1f2",
--   delete = "#e26a75",
-- },

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
			-- Opencode
			hl.OpencodeDiffAdd = { bg = c.diff.add }
			hl.OpencodeDiffDelete = { bg = c.diff.delete }
			hl.OpencodeDiffGutter = { fg = c.fg_gutter, bg = c.bg_dark1 }
			hl.OpencodeDiffAddGutter = { fg = c.green, bg = c.bg_dark1 }
			hl.OpencodeDiffDeleteGutter = { fg = c.red, bg = c.bg_dark1 }
			hl.OpencodeInputLegend = { fg = c.blue5 }
			-- Fyler git colors
			hl.FylerGitModified = { fg = c.git.change }
			hl.FylerGitUntracked = { fg = c.git.add }
			-- TabLine
			hl.TabLine = { fg = c.fg_dark, bg = c.bg_statusline }
			hl.TabLineSel = { fg = c.blue, bg = c.fg_gutter }
			hl.TabLineFill = { fg = c.fg_sidebar, bg = c.bg }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		local auto_dark_mode = require("lazy.core.config").plugins["auto-dark-mode.nvim"]
		local auto_dark_mode_enabled = auto_dark_mode and auto_dark_mode._.cond
		if not auto_dark_mode_enabled then
			vim.cmd("colorscheme tokyonight")
		end
	end,
}
