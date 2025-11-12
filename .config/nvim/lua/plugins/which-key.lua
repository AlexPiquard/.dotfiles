return {
	-- show key mappings
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		opts = { preset = "modern" },
		keys = {
			{ "<leader>wK", "<cmd>WhichKey <CR>", desc = "whichkey all keymaps" },
			{
				"<leader>wk",
				function()
					vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
				end,
				desc = "whichkey query lookup",
			},
		},
	},
}
