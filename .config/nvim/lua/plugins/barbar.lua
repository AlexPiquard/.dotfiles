-- top bar & tabs
return {
	"romgrk/barbar.nvim",
	lazy = false,
	dependencies = {
		"lewis6991/gitsigns.nvim",
		-- mocked by mini.icons
		"nvim-tree/nvim-web-devicons",
	},
	-- init = function()
	-- 	vim.g.barbar_auto_setup = false
	-- end,
	opts = {
		animation = true,
		icons = {
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true },
				[vim.diagnostic.severity.WARN] = { enabled = true },
				[vim.diagnostic.severity.INFO] = { enabled = true },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
		},
	},
	keys = {
		{
			"<A-,>",
			"<Cmd>BufferPrevious<CR>",
			desc = "Previous Tab",
			mode = "n",
		},
		{
			"<A-;>",
			"<Cmd>BufferNext<CR>",
			desc = "Next Tab",
			mode = "n",
		},
		{
			"<A-k>",
			"<Cmd>BufferClose<CR>",
			desc = "Close Tab",
			mode = "n",
		},
		{
			"<A-p>",
			"<Cmd>BufferPick<CR>",
			desc = "Pick Tab",
			mode = "n",
		},
	},
}
