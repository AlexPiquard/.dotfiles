local configurate = function()
	-- vscode format
	require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
	require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

	-- snipmate format
	require("luasnip.loaders.from_snipmate").load()
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	-- lua format
	require("luasnip.loaders.from_lua").load()
	require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})
end

return {
	-- autocomplete & suggestions
	{
		"saghen/blink.cmp",
		version = "*",
		event = { "InsertEnter", "CmdLineEnter" },

		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					configurate()
				end,
			},

			"onsails/lspkind.nvim",
		},

		opts_extend = { "sources.default" },

		opts = {
			snippets = { preset = "luasnip" },
			cmdline = { enabled = true },
			appearance = { nerd_font_variant = "normal" },
			fuzzy = { implementation = "prefer_rust" },
			sources = {
				default = { "lsp", "snippets", "buffer", "path" },
			},
			signature = { enabled = true },

			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			completion = {
				ghost_text = { enabled = false },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
					window = { border = "single" },
					treesitter_highlighting = true,
				},

				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},

				menu = {
					enabled = true,
					scrollbar = false,
					border = "single",
					max_height = 30,
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						components = {
							kind_icon = {
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
								-- (optional) use highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
							kind = {
								-- (optional) use highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
						},
					},
				},
			},
		},
	},
}
