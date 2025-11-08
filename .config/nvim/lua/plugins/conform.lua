return {
	-- formatting
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>pp",
				function()
					require("conform").format()
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			async = true,
			lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				json = {"biome"},
				jsonc = {"biome"},
				html = { "prettier" },
				java = { "google-java-format" },
			},
		},
	},
}
