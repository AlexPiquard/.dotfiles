local function term_nav(dir)
	---@param self snacks.terminal
	return function(self)
		return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
			vim.cmd.wincmd(dir)
		end)
	end
end

return {
	"folke/snacks.nvim",
	opts = {
		terminal = {
			enabled = true,
			win = {
				keys = {
					close_h = { "<A-h>", "hide", desc = "Hide terminal", expr = true, mode = "t" },
					close_v = { "<A-v>", "hide", desc = "Hide terminal", expr = true, mode = "t" },
					close_i = { "<A-i>", "hide", desc = "Hide terminal", expr = true, mode = "t" },
					nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
					nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
					nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
					nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
				},
			},
		},
	},
	keys = {
		{
			"<A-h>",
			function()
				Snacks.terminal(nil, { count = 1, shell = "zsh", interactive = true, win = { wo = { winbar = "" } } })
			end,
		},
		{
			"<A-v>",
			function()
				Snacks.terminal(
					nil,
					{ count = 2, shell = "zsh", interactive = true, win = { position = "right", wo = { winbar = "" } } }
				)
			end,
		},
		{
			"<A-i>",
			function()
				Snacks.terminal(nil, { count = 3, shell = "zsh", interactive = true, win = { position = "float" } })
			end,
		},
	},
}
