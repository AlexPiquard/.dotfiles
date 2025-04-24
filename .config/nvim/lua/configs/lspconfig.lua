-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- Modifier la commande jdtls utilisée, en conservant celle par defaut
local jdtlsCmd = lspconfig.jdtls.document_config.default_config.cmd
jdtlsCmd[#jdtlsCmd + 1] = "--java-executable"
jdtlsCmd[#jdtlsCmd + 1] = vim.env.HOME .. "/.local/share/mise/installs/java/21.0.2/bin/java"

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
		cmd = jdtlsCmd,
	},
	biome = {
		-- Use biome config file from current opened project
		root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
	},
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for lsp, opts in pairs(servers) do
	local config = {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
	for k, v in pairs(opts) do
		config[k] = v
	end

	lspconfig[lsp].setup(config)

	-- vim.lsp.enable(lsp)
  -- vim.lsp.config(lsp, opts)
end
