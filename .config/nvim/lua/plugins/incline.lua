local separator = " "

-- buffer name and related info at top right window corner
return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<A-n>",
			"<cmd>tabnew<cr>",
			desc = "New tab",
		},
		{
			"<A-k>",
			"<cmd>tabclose<cr>",
			desc = "Close tab",
		},
		{
			"<A-;>",
			"<cmd>tabnext<cr>",
			desc = "Next tab",
		},
		{
			"<A-,>",
			"<cmd>tabprev<cr>",
			desc = "Previous tab",
		},
	},
	config = function()
		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = {
						default = true,
						group = "PmenuThumb",
					},
					InclineNormalNC = {
						default = true,
						group = "PmenuThumb",
					},
				},
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = require("mini.icons").get("file", filename)
				local modified = vim.bo[props.buf].modified and "WarningMsg" or ""

				local function get_git_diff()
					local icons = { removed = "-", changed = "~", added = "+" }
					local groups = { removed = "GitSignsDelete", changed = "GitSignsChange", added = "GitSignsAdd" }
					local signs = vim.b[props.buf].gitsigns_status_dict
					local labels = {}
					if signs == nil then
						return labels
					end
					for name, icon in pairs(icons) do
						if tonumber(signs[name]) and signs[name] > 0 then
							table.insert(labels, { icon .. signs[name] .. " ", group = groups[name], guibg = "none" })
						end
					end
					if #labels > 0 then
						table.insert(labels, { separator })
					end
					return labels
				end

				local function get_diagnostic_label()
					local icons = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " }
					local label = {}

					for severity, icon in pairs(icons) do
						local n = #vim.diagnostic.get(
							props.buf,
							{ severity = vim.diagnostic.severity[string.upper(severity)] }
						)
						if n > 0 then
							table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
						end
					end
					if #label > 0 then
						table.insert(label, { separator })
					end
					return label
				end

				return {
					{ get_diagnostic_label() },
					{ get_git_diff() },
					{ (ft_icon or "") .. " ", group = ft_color },
					{ filename .. " ", group = modified },
					{ separator .. " " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
					-- TODO: green window icon when active
				}
			end,
		})
	end,
}
