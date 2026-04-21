return {
	-- completely replaces the UI for messages, cmdline and the popupmenu.
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			progress = {
				enabled = true,
			},
			hover = {
				-- adds border
				enabled = true,
			},
			signature = {
				-- blink's signature is disabled
				enabled = true,
			},
		},
		cmdline = {
			enabled = true,
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		messages = {
			enabled = true,
			view = "notify",
		},
		popupmenu = {
			-- completion menu inside cmdline
			-- using blink instead
			enabled = false,
		},
		notify = {
			-- use snacks.notify
			enabled = false,
		},
		routes = {
			{
				-- long notifications at bottom
				filter = {
					event = "msg_show",
					min_height = 10,
				},
				view = "messages",
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
