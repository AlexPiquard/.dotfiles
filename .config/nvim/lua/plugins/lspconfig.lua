local map = vim.keymap.set

local diagnostic_config = function()
	local x = vim.diagnostic.severity

	vim.diagnostic.config({
		virtual_text = { prefix = "" },
		signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
		underline = true,
		float = { border = "single" },
	})
end
diagnostic_config()

local on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	-- "go to references" is mapped in snacks.picker
	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>T", vim.lsp.buf.type_definition, opts("Go to type definition"))
end

-- disable semanticTokens
local on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		on_attach(_, args.buf)
	end,
})

local lua_lsp_settings = {
	Lua = {
		workspace = {
			library = {
				vim.fn.expand("$VIMRUNTIME/lua"),
				vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
				"${3rd}/luv/library",
			},
		},
	},
}

local configurate = function()
	-- Modifier la commande jdtls utilisée, en conservant celle par defaut
	local jdtlsCmd = {
		"jdtls",
		-- "-configuration",
		-- os.getenv("HOME") .. "/.cache/jdtls/config",
		-- "-data",
		-- os.getenv("HOME") .. "/.cache/jdtls/workspace",
		"--java-executable",
		vim.env.HOME .. "/.local/share/mise/installs/java/21.0.2/bin/java",
	}

	local servers = {
		lua_ls = {
			settings = lua_lsp_settings,
		},
		html = {},
		cssls = {},
		clangd = {},
		ts_ls = {},
		-- phpactor = {},
		pylsp = {},
		marksman = {},
		tailwindcss = {},
		jdtls = {
			-- for lombok, add in .zshrc
			-- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
			cmd = jdtlsCmd,
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-17",
								path = vim.env.HOME .. "/.local/share/mise/installs/java/17.0.2/bin/java",
							},
						}
					}
				}
			}
		},
		biome = {
			-- Use biome config file from current opened project
			-- root_dir = require("lspconfig.util").root_pattern("biome.json", "biome.jsonc"),
		},
		gopls = {},
	}

	-- lsps with default config
	for lsp, opts in pairs(servers) do
		local config = {
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		}
		for k, v in pairs(opts) do
			config[k] = v
		end

		vim.lsp.config(lsp, config)
		vim.lsp.enable(lsp)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			configurate()
		end,
	},
}
