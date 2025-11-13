local open_lazygit = function()
	Snacks.terminal("lazygit", {win = {position = "float"}})
end

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.config
		opts = {
			animate = { enabled = true },
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			bufdelete = { enabled = true },
			---@class snacks.dashboard.config
			---@field enabled? boolean
			---@field sections snacks.dashboard.section
			debug = { enabled = true },
			notifier = { enabled = true },
			notify = { enabled = true },
			picker = { enabled = true, exclude = { "bin" }, matcher = { smartcase = false } },
			statuscolumn = { enabled = true },
			indent = { enabled = true },
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
			-- {
			-- 	"<c-n>",
			-- 	function()
			-- 		Snacks.explorer()
			-- 	end,
			-- 	desc = "File Explorer",
			-- },
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
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
				"<a-n>",
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
		},
	},
}
