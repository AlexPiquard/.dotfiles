local languages = {
	"lua",
	"luadoc",
	"printf",
	"vim",
	"vimdoc",
	"typescript",
	"typescriptreact",
	"javascript",
	"tsx",
	"markdown",
	"markdown_inline",
	"html",
	"go",
	"java",
}

return {
	-- syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile", "FileType" },
		-- dependencies = { "OXY2DEV/markview.nvim" },
		cmd = { "TSInstall", "TSInstallFromGrammar", "TSUpdate", "TSUninstall", "TSLog" },
		build = ":TSUpdate",
		branch = "main",
		opts = {
			highlight = { enable = true },
			folds = { enabled = true },
			indent = { enable = false },
		},
		config = function(_, _)
			require("nvim-treesitter").install(languages)
			for _, lang in ipairs(languages) do
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { lang },
					callback = function()
						vim.treesitter.start()
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.opt.foldmethod = "expr"
						vim.opt.foldlevelstart = 99
					end,
				})
			end
		end,
	},
}
