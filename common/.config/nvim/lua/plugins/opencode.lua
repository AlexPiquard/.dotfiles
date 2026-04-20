return {
	"sudo-tee/opencode.nvim",
	cond = function()
		return vim.fn.executable("opencode") == 1
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		-- for file mentions and commands completion
		"saghen/blink.cmp",

		-- for file mentions picker
		"folke/snacks.nvim",
	},
	opts = {
		preferred_picker = "snacks",
		preferred_completion = "blink",
		ui = {
			input = {
				text = {
					wrap = true,
				},
			},
		},
	},
	keys = {
		-- every opencode command will lazy load the plugin and work
		{ "<leader>o", mode = { "n", "v" }, desc = "Enable Opencode" },
	},
}
