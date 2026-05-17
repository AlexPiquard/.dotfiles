return {
	{
		-- Supercharge the rust experience
		-- use "MasonInstall codelldb" for debugger to work
		"mrcjkb/rustaceanvim",
		version = "^8",
		ft = "rust",
		opts = {
			tools = {
				float_win_config = {
					auto_focus = false,
				},
			},
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>dr", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "Rust Debuggables", buffer = bufnr })
					-- vim.keymap.set("n", "<C-w>e", function()
					-- 	vim.cmd.RustLsp("explainError")
					-- end, { silent = true, desc = "Explain rust diagnostics", buffer = bufnr })
					-- vim.keymap.set("n", "<C-w>z", function()
					-- 	vim.cmd.RustLsp("renderDiagnostic")
					-- end, { silent = true, desc = "Render rust diagnotics", buffer = bufnr })
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						-- use bacon
						checkOnSave = false,
						diagnostics = {
							-- use bacon
							enable = false,
						},
						procMacro = {
							enable = true,
						},
						files = {
							exclude = {
								".direnv",
								".git",
								".jj",
								".github",
								".gitlab",
								"bin",
								"node_modules",
								"target",
								"venv",
								".venv",
							},
							-- Avoid Roots Scanned hanging, see https://github.com/rust-lang/rust-analyzer/issues/12613#issuecomment-2096386344
							watcher = "client",
						},
					},
				},
			},
		},
		config = function(_, opts)
			local codelldb = vim.fn.exepath("codelldb")
			local codelldb_lib_ext = io.popen("uname"):read("*l") == "Linux" and ".so" or ".dylib"
			local library_path = vim.fn.expand("$MASON/opt/lldb/lib/liblldb" .. codelldb_lib_ext)
			opts.dap = {
				adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
			}
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
			if vim.fn.executable("rust-analyzer") == 0 then
				Snacks.notifier(
					"**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
					"error"
				)
			end
		end,
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				bacon_ls = true,
				mesonlsp = true,
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				bacon = {
					executable_cond = "cargo",
				},
				mesonlsp = true,
			},
		},
	},
}
