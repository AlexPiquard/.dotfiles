return {
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
		lazy = false,
		ft = { "markdown", "opencode_output" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			latex = { enabled = false },
			completions = {
				blink = {
					enabled = true,
				},
				lsp = { enabled = true },
			},
			file_types = {
				"markdown",
				"opencode_output",
			},
			overrides = {
				filetype = {
					opencode_output = { anti_conceal = { enabled = false } },
				},
			},
		},
	},
}
