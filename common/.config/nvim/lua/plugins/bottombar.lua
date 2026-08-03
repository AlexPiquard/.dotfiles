return {
	-- bottom bar
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		local colors = require("tokyonight.colors").setup()
		require("lualine").setup({
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
				-- show recording and search
				lualine_x = {
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = colors.orange },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = colors.blue },
					},
				},
			},
		})
	end,
}
