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
			"<leader>j",
			function()
				Snacks.terminal(nil, { count = 1, shell = "zsh", interactive = true, win = { wo = { winbar = "" } } })
			end,
		},
		{
			"<leader>l",
			function()
				Snacks.terminal(
					nil,
					{ count = 2, shell = "zsh", interactive = true, win = { position = "right", wo = { winbar = "" } } }
				)
			end,
		},
		{
			"<leader>i",
			function()
				Snacks.terminal(nil, { count = 3, shell = "zsh", interactive = true, win = { position = "float" } })
			end,
		},
	},
}
