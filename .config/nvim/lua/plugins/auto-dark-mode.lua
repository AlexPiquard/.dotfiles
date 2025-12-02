local function set_theme(name)
	vim.cmd("colorscheme " .. name)
end

return {
	"f-person/auto-dark-mode.nvim",
	event = "VeryLazy",
	opts = {
		set_dark_mode = function()
			set_theme("tokyonight-moon")
		end,
		set_light_mode = function()
			set_theme("tokyonight-day")
		end,
		update_interval = 1000,
	},
}
