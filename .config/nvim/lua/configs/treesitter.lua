local options = require("nvchad.configs.treesitter")
table.insert(options.ensure_installed, "typescript")
table.insert(options.ensure_installed, "javascript")
table.insert(options.ensure_installed, "tsx")
table.insert(options.ensure_installed, "markdown")
table.insert(options.ensure_installed, "markdown_inline")
table.insert(options.ensure_installed, "html")
table.insert(options.ensure_installed, "go")
return options
