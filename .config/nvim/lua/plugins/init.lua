return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>pp",
        function()
          require("conform").format()
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = require "configs.conform",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      view = { adaptive_size = true }
    },
  },

  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

	{ import = "nvchad.blink.lazyspec" },

	-- Modify 'treesitter' configuration
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function ()
			return require "configs.treesitter"
		end,
		config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
	}
}
