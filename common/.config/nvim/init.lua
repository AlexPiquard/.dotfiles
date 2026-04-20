vim.g.mapleader = " "

require("config.lazy")
require("options")

vim.schedule(function()
	require("mappings")
end)
