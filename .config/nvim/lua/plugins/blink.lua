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

local function get_mini_icon(ctx)
	if ctx.source_name == "Path" then
		local is_unknown_type =
			vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
		local mini_icon, mini_hl, _ = require("mini.icons").get(
			is_unknown_type and "os" or ctx.item.data.type,
			is_unknown_type and "" or ctx.label
		)
		if mini_icon then
			return mini_icon, mini_hl
		end
	end
	local mini_icon, mini_hl, _ = require("mini.icons").get("lsp", ctx.kind)
	return mini_icon, mini_hl
end

return {
	-- autocomplete & suggestions
	"saghen/blink.cmp",
	version = "*", -- updates at version, not commit
	event = "BufReadPost",

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

		-- adds words from entire project as completions
		"mikavilpas/blink-ripgrep.nvim",

		-- better colors for entries
		"xzbdmw/colorful-menu.nvim",
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

		-- show function parameters (disabled to use noice)
		signature = { enabled = false },

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
					columns = { { "kind_icon" }, { "label", "kind", gap = 1 } },
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _ = get_mini_icon(ctx)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl = get_mini_icon(ctx)
								-- check for color derived from documentation
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
								local _, hl = get_mini_icon(ctx)
								return hl
							end,
						},
						label = {
							text = function(ctx)
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									-- Or you want to add more item to label
									return highlights_info.label
								else
									return ctx.label
								end
							end,
							highlight = function(ctx)
								local highlights = {}
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									highlights = highlights_info.highlights
								end
								for _, idx in ipairs(ctx.label_matched_indices) do
									table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
								end
								-- Do something else
								return highlights
							end,
						},
					},
				},
			},
		},
	},
}
