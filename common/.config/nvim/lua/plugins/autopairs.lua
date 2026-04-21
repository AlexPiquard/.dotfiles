return {
	-- Auto pairs
	-- Automatically inserts a matching closing character
	-- when you type an opening character like `"`, `[`, or `(`.
	"windwp/nvim-autopairs",
	event = "BufReadPost",
	opts = {
		-- alt-e to add the closing thing after word
		fast_wrap = {},
		disable_filetype = { "markdown", "snacks_picker_input" },
		ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		-- disable in string
		enable_bracket_in_quote = false,
		-- (|)) -> ((|))
		enable_check_bracket_line = true,
	},
	config = function(_, opts)
		local autopairs = require("nvim-autopairs")
		local cond = require("nvim-autopairs.conds")
		local Rule = require("nvim-autopairs.rule")

		autopairs.setup(opts)

		-- disable ' for rust
		autopairs.add_rule(Rule("'", "'"):with_pair(cond.not_filetypes({ "rust" })))
	end,
}
