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
	"rust",
}

return {
	-- syntax highlight
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile", "FileType" },
	cmd = { "TSInstall", "TSInstallFromGrammar", "TSUpdate", "TSUninstall", "TSLog" },
	build = ":TSUpdate",
	branch = "main",
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

					-- enable indentation based on treesitter (fixes issues in jsx for example)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end
	end,
}
