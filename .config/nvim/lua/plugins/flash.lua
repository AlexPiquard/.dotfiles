return {
	{
		-- Navigate the code with search labels
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				search = {
					enabled = true,
				},
				char = {
					jump_labels = true,
				}
			}
		},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			-- do something remotely and go back
			-- d/c/y then r, search and go like with "s", then a motion like iw for inner word, or i and a closing character, or use "s" 
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			-- v/d/c/y then R, search and select the letter which surrounds the desired area
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			-- use C-s to enable/disable flash in "/" search
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			-- "f" : search next character, then f to next, F to previous
			-- "t" : same as "f" but goes just before
		},
	},
}
