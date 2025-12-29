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
		-- adds words from entire project as completions
		"mikavilpas/blink-ripgrep.nvim",
	},

	opts_extend = { "sources.default" },

	opts = {
		snippets = { preset = "luasnip" },
		cmdline = { enabled = true },
		appearance = { nerd_font_variant = "normal" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		sources = {
			default = { "lazydev", "lsp", "snippets", "buffer", "path", "ripgrep" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					---@module "blink-ripgrep"
					---@type blink-ripgrep.Options
					opts = {},
					-- shown last
					score_offset = -2000,
				},
			},
		},

		-- show function parameters
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
			keyword = { range = "full" },
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
					auto_insert = true,
				},
			},

			accept = {
				auto_brackets = {
					kind_resolution = {
						-- fix auto brackets for react
						blocked_filetypes = {},
					},
				},
			},

			menu = {
				enabled = true,
				scrollbar = false,
				border = "single",
				max_height = 30,
				draw = {
					treesitter = { "lsp" },
					columns = { { "kind_icon" }, { "label", "label_description", "source_name", gap = 1 } },
					components = {
						kind_icon = {
							text = function(ctx)
								local icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr ~= "" then
										icon = color_item.abbr
									end
								end

								return icon .. ctx.icon_gap
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr_hl_group then
										hl = color_item.abbr_hl_group
									end
								end

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
}
