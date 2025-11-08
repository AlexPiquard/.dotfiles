vim.g.table_mode_corner = '|'
vim.g.table_mode_map_prefix = '<leader>tm'
vim.g.table_mode_tableize_map = '<leader>tc'
vim.g.table_mode_delete_row_map = '<leader>tdr'

return {
	{
		"dhruvasagar/vim-table-mode",
		lazy = false,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		-- ft = "markdown" -- If you decide to lazy-load anyway

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			-- "nvim-treesitter/nvim-treesitter",

			"nvim-mini/mini.icons",
			"saghen/blink.cmp",
		},
		priority = 49, -- load before nvim-treesitter
		opts = function()
			local presets = require("markview.presets")
			return {
				markdown = {
					tables = presets.tables.single,
					horizontal_rules = presets.horizontal_rules.thin,
				},
				preview = {
					icon_provider = "mini"
				}
			}
		end,
	},
}
