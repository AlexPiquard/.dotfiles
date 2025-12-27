return {
	"NickvanDyke/opencode.nvim",
	lazy = false,
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	keys = {
		{
			"<leader>oa",
			function()
				require("opencode").ask("@this: ", { submit = true })
			end,
			desc = "Ask opencode",
			mode = {"n", "v"},
		},
		{
			"<leader>os",
			function()
				require("opencode").select()
			end,
			desc = "Execute opencode action…",
			mode = { "n", "x" },
		},
		{
			"<leader>oo",
			function()
				require("opencode").toggle()
			end,
			desc = "Toggle opencode",
			mode = { "n", "t" },
		},
		{
			"<A-u>",
			function()
				require("opencode").command("session.half.page.up")
			end,
			desc = "opencode half page up",
			mode = "n",
		},
		{
			"<A-d>",
			function()
				require("opencode").command("session.half.page.down")
			end,
			desc = "opencode half page down",
			mode = "n",
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
			provider = {
				enabled = "snacks",
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- TODO: hide useless right pane
	end,
}
