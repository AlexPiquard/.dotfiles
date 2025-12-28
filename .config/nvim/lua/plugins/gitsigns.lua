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
		{ "<leader>hr", require("gitsigns").reset_hunk, desc = "Git reset hunk" },
		{
			mode = "v",
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "Git reset hunk",
		},
		{ "<leader>hR", require("gitsigns").reset_buffer, desc = "Git reset buffer" },
		{ "<leader>hp", require("gitsigns").preview_hunk, desc = "Git preview hunk" },
		{
			"<leader>hb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git blame",
		},
	},
}
