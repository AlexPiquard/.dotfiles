-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
	html = {},
	cssls = {},
	clangd = {},
	ts_ls = {},
	phpactor = {},
	pylsp = {},
	marksman = {},
	jdtls = {
		-- for lombok, add in .zshrc
		-- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
	},
	biome = {
		-- Use biome config file from current opened project
		root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc")
	}
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for lsp, opts in pairs(servers) do
	lspconfig[lsp].setup {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
    opts
	}
end
