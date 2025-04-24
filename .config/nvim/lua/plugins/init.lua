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

	-- copy of nvchad/blink/lazyspec (nvchad/ui)
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      },
    },

    opts_extend = { "sources.default" },

    opts = function()
      return require "configs.blink"
    end,
  },
	-- end

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
