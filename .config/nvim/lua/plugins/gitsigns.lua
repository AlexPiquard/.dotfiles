return {
	-- git stuff
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = {
			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		},
		keys = {
			{ "<leader>hr", require("gitsigns").reset_hunk, "Git reset hunk" },
			{
				mode = "v",
				"<leader>hr",
				function()
					require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				"Git reset hunk",
			},
			{ "<leader>hR", require("gitsigns").reset_buffer, "Git reset buffer" },
			{ "<leader>hp", require("gitsigns").preview_hunk, "Git preview hunk" },
			{
				"<leader>hb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				"Git blame",
			},
		},
}
