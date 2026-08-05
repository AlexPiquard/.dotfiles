local function set_theme(name)
	vim.cmd("colorscheme " .. name)
end

-- dark theme colors:
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

-- light theme colors:
-- bg = "#d3d4e0",
-- bg_dark = "#c3c8da",
-- bg_dark1 = "#b5bed5",
-- bg_highlight = "#bdc0d5",
-- blue = "#0078e9",
-- blue0 = "#5679e4",
-- blue1 = "#007ab4",
-- blue2 = "#07879d",
-- blue5 = "#006a83",
-- blue6 = "#2e5857",
-- blue7 = "#92a6d5",
-- comment = "#727ab0",
-- cyan = "#18687a",
-- dark3 = "#8990b3",
-- dark5 = "#68709a",
-- fg = "#365fa6",
-- fg_dark = "#555f8d",
-- fg_gutter = "#a8aecb",
-- git = {
--   add = "#57683e",
--   change = "#3a7ee4",
--   delete = "#a83643"
-- },
-- green = "#506138",
-- green1 = "#287769",
-- green2 = "#38919f",
-- magenta = "#9f46ff",
-- magenta2 = "#d20065",
-- orange = "#bf5700",
-- purple = "#be19a7",
-- red = "#ff053b",
-- red1 = "#e34561",
-- teal = "#287769",
-- terminal_black = "#9ea2c5",
-- yellow = "#815b00"

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
			light_style = "moon",
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},

			-- transparent = true,
			-- styles = {
			-- 	sidebars = "transparent",
			-- 	floats = "transparent",
			-- },
			on_highlights = function(hl, c)
				-- Fyler git colors
				hl.FylerGitModified = { fg = c.git.change }
				hl.FylerGitUntracked = { fg = c.git.add }
				-- TabLine
				hl.TabLine = { fg = c.fg_dark, bg = c.bg_statusline }
				hl.TabLineSel = { fg = c.blue, bg = c.fg_gutter }
				hl.TabLineFill = { fg = c.fg_sidebar, bg = c.bg }
				-- Flash
				hl.FlashLabel = { fg = c.bg, bg = "#d20065" }
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
	},
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		priority = 999,
		cond = function()
			local cmd =
				"dbus-send --session --print-reply=literal --reply-timeout=1000 --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.portal.Settings.Read string:org.freedesktop.appearance string:color-scheme"

			local result = vim.fn.system(cmd)
			return result:match("uint32%s+1") or result:match("uint32%s+[02]")
		end,
		opts = {
			set_dark_mode = function()
				set_theme("tokyonight-moon")
			end,
			set_light_mode = function()
				set_theme("tokyonight-day")
			end,
			update_interval = 1000,
		},
	},
}
