return {
	-- bottom bar
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		extensions = { "lazy" },
		options = {
			globalstatus = true,
		},
		sections = {
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					symbols = {
						error = "󰅙 ",
						warn = " ",
						info = "󰋼 ",
						hint = "󰌵 ",
					},
				},
			},
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
