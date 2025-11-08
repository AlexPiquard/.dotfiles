return {
  {
    "nvim-neotest/neotest",
    lazy = true,
		enabled = false,
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    config = function()
      require("neotest").setup({
       adapters = {
          require("neotest-phpunit"),
          require("neotest-jest")
        },
      })
    end
  }
}
