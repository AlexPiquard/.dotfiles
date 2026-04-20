return {
	-- Break bad habits, master Vim motions
	"m4xshen/hardtime.nvim",
	enabled = false,
	event = "BufReadPost",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_filetypes = {
			lazy = true,
			["dapui*"] = true,
			fyler = true,
		},
	},
}
