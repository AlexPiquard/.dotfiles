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
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		popupmenu = {
			-- completion menu inside cmdline
			-- using blink instead
			enabled = false,
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
