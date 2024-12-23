local options = {
  async = true,
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    java = { "google-java-format" },
  },
}

return options
