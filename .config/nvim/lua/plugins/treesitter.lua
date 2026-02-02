local languages = {
	"lua",
	"luadoc",
	"printf",
	"vim",
	"vimdoc",
	"typescript",
	"javascript",
	"tsx",
	"markdown",
	"markdown_inline",
	"html",
	"go",
	"java",
	"rust",
	"yaml",
	"xml",
	"zsh",
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

		-- auto-start highlights & indentation
		vim.api.nvim_create_autocmd("FileType", {
			desc = "User: enable treesitter highlighting",
			callback = function(ctx)
				-- highlights
				local hasStarted = pcall(vim.treesitter.start, ctx.buf) -- errors for filetypes with no parser

				-- indent
				if hasStarted then
					vim.bo[ctx.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.opt.foldmethod = "expr"
					vim.opt.foldlevelstart = 99
				end
			end,
		})
	end,
}
