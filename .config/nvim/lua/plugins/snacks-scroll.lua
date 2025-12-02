return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.config
	opts = {
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 100 },
				easing = "linear",
			},
			animate_repeat = {
				delay = 50,
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
		},
	},
}
