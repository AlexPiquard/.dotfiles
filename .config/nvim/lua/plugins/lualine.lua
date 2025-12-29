return {
	-- bottom bar
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		extensions = { "lazy", "fzf" },
		options = {
			disabled_filetypes = { "snacks_terminal" },
		},
		sections = {
			-- show recording
			lualine_x = {
				{
					require("noice").api.status.message.get_hl,
					cond = require("noice").api.status.message.has,
				},
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
					color = { fg = "#ff9e64" },
				},
				{
					require("noice").api.status.search.get,
					cond = require("noice").api.status.search.has,
					color = { fg = "#ff9e64" },
				},
			},
		},
	},
}
