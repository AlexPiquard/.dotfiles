return {
	"sudo-tee/opencode.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		-- for file mentions and commands completion
		"saghen/blink.cmp",

		-- for file mentions picker, pick only one
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
}
