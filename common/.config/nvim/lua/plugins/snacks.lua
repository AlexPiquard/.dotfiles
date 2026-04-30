local open_lazygit = function()
	Snacks.terminal("lazygit", { win = { position = "float" } })
end

return {
	"folke/snacks.nvim",
	priority = 900,
	lazy = false,
	---@type snacks.config
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
		debug = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 5000,
		},
		notify = { enabled = true },
		picker = {
			enabled = true,
			exclude = { "bin" },
			sources = {
				files = { hidden = true },
				grep = { hidden = true },
				todo_comments = { hidden = true },
			},
			matcher = { smartcase = false },
			jump = {
				reuse_win = true,
			},
			win = {
				input = {
					keys = {
						-- S-CR cant be made, so we define another keymap
						["<C-w>"] = { { "pick_win", "jump" }, mode = { "i", "n" } },
					},
				},
			},
		},
		statuscolumn = { enabled = true },
		-- just indent visual guides
		indent = { enabled = true },
		image = { enabled = true },
		input = { enabled = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				open_lazygit()
			end,
			desc = "LazyGit",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git log [f]ile",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git [l]og",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git log [L]ine",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git [d]iff",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers({
					unloaded = false,
					win = {
						input = {
							keys = {
								["dd"] = { "bufdelete", mode = { "n" } },
							},
						},
					},
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>u",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "Lsp references",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.treesitter()
			end,
			desc = "Treesitter",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
	},
}
