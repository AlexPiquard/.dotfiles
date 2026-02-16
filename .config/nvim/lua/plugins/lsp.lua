-- change diagnostics config like icons in left column of editor
local x = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = { prefix = "" },
	signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
	underline = true,
	float = { border = "single" },
})

-- what client can do, sent to lsp server
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

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- register mappings when lsp server is attached
local map = vim.keymap.set
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local function opts(desc)
			return { buffer = args.buf, desc = "LSP " .. desc }
		end

		-- "go to references" is mapped in snacks.picker
		map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))

		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts("List workspace folders"))

		map("n", "<leader>T", vim.lsp.buf.type_definition, opts("Go to type definition"))
	end,
})

-- nvim-lspconfig is a list of configs to use lsp servers
-- mason is used to install lsp servers
-- mason-lspconfig is linking the two and enabling all installed servers
return {
	"mason-org/mason-lspconfig.nvim",
	event = "User FilePost",
	opts = {
		-- add languages here
		ensure_installed = {
			"lua_ls",
			"html",
			"cssls",
			"clangd",
			"ts_ls",
			"pylsp",
			"marksman",
			"tailwindcss",
			"jdtls",
			"biome",
			"gopls",
			"rust_analyzer",
			"bashls"
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			cmd = { "Mason", "MasonInstall", "MasonUpdate" },
			opts = {
				PATH = "skip",

				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},

				max_concurrent_installers = 10,
			},
		},
		{
			"neovim/nvim-lspconfig",
			event = "User FilePost",
		},
	},
}
