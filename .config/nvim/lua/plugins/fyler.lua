return {
	-- A neovim file manager which can edit file system like a buffer with tree view
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	lazy = false,
	opts = {
		hooks = {},
		integrations = {
			icon = "mini_icons",
			-- opens file in current window
			winpick = "none",
		},
		views = {
			finder = {
				close_on_select = false,
				-- Skip confirmation for simple operations
				confirm_simple = true,
				default_explorer = false,
				delete_to_trash = false,
				columns_order = { "permission", "size", "git", "diagnostic" },
				columns = {
					git = {
						enabled = true,
						symbols = {
							Untracked = "?",
							Added = "+",
							Modified = "~",
							Deleted = "-",
							Renamed = "→",
							Copied = "c",
							Conflict = "!",
							Ignored = " ",
						},
					},
					diagnostic = {
						enabled = true,
						symbols = {
							Error = "󰅙 ",
							Warn = " ",
							Info = "󰋼 ",
							Hint = "󰌵 ",
						},
					},
					permission = {
						enabled = true,
					},
					size = {
						enabled = true,
					},
				},
				icon = {
					directory_collapsed = nil,
					directory_empty = nil,
					directory_expanded = nil,
				},
				indentscope = {
					enabled = true,
					markers = {
						{ "│", "FylerIndentMarker" },
						{ "└", "FylerIndentMarker" },
					},
				},
				mappings = {
					["q"] = "CloseView",
					["<CR>"] = "Select",
					["<C-t>"] = "SelectTab",
					["|"] = "SelectVSplit",
					["-"] = "SelectSplit",
					["^"] = "GotoParent",
					["="] = "GotoCwd",
					["."] = "GotoNode",
					["#"] = "CollapseAll",
					["<BS>"] = "CollapseNode",
				},
				mappings_opts = {
					nowait = false,
					noremap = true,
					silent = true,
				},
				follow_current_file = true,
				-- Automatically updated finder on file system events
				watcher = {
					enabled = false,
				},
				win = {
					border = vim.o.winborder == "" and "single" or vim.o.winborder,
					buf_opts = {
						bufhidden = "hide",
						buflisted = false,
						buftype = "acwrite",
						expandtab = true,
						filetype = "fyler",
						shiftwidth = 2,
						syntax = "fyler",
						swapfile = false,
					},
					kind = "replace",
					kinds = {
						float = {
							height = "70%",
							width = "70%",
							top = "10%",
							left = "15%",
						},
						replace = {},
						split_above = {
							height = "70%",
						},
						split_above_all = {
							height = "70%",
							win_opts = {
								winfixheight = true,
							},
						},
						split_below = {
							height = "70%",
						},
						split_below_all = {
							height = "70%",
							win_opts = {
								winfixheight = true,
							},
						},
						split_left = {
							width = "30%",
						},
						split_left_most = {
							width = "30%",
							win_opts = {
								winfixwidth = true,
							},
						},
						split_right = {
							width = "30%",
						},
						split_right_most = {
							width = "30%",
							win_opts = {
								winfixwidth = true,
							},
						},
					},
					win_opts = {
						concealcursor = "nvic",
						conceallevel = 3,
						cursorline = false,
						number = false,
						relativenumber = false,
						signcolumn = "no",
						winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
						wrap = false,
					},
				},
			},
		},
	},
	keys = {
		{ "<C-n>", "<Cmd>Fyler kind=float<Cr>", desc = "Open Fyler View" },
	},
}
