local options = require("nvchad.blink.config")
options.keymap["<Tab>"] = { "select_next", "fallback" }
options.keymap["<S-Tab>"] = { "select_prev", "fallback" }
options.completion.menu.max_height = 30
options.completion.menu.draw.columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } }

return options
