return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
			signs = true,
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]]
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]]
      }
    },
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" }
    },
  }
}
