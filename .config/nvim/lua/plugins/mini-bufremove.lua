return {
	-- Buffer removing (unshow, delete, wipeout), which saves window layout
	"nvim-mini/mini.bufremove",
	event = "User FilePost",
	config = true,
	keys = {
		{
			"<leader>b",
			function()
				MiniBufremove.delete()
			end,
			desc = "Remove buffer",
		},
	},
}
