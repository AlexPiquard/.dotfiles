return {
	-- print debug for variable
	"rareitems/printer.nvim",
	config = true,
	keys = {
		{
			"gp",
			"<Plug>(printer_below)",
			mode = { "n", "x" },
			desc = "Printer debug",
		},
	},
}
