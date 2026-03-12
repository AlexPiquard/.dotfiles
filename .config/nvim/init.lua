vim.g.mapleader = " "

require("config.lazy")
require("options")
require("scripts.lsp_hover").setup()

vim.schedule(function()
	require("mappings")
end)
