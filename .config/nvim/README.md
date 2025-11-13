# help

- Lazy : plugins
- MasonInstall : install lsp server (autocompletion, errors)
- lspconfig.lua : use lsp server
- TSInstall : syntax highlighting
- conform.lua : lint

To add a language, just add it to the `ensure_installed` list in `lsp.lua`, and in `treesitter.lua` for the colors.

To edit the default lsp config provided by lspconfig, create a file at `.config/nvim/after/lsp/[name].lsp`

# vim


| mode                   | keymap |
|------------------------|--------|
| \[v\]isual (selection) | v      |
| insert \[a\]fter       | a      |
| insert before          | i      |
| replace                | r      |


| operator          | keymap |
|-------------------|--------|
| delete            | d      |
| delete and insert | c      |
| copy              | y      |
| paste             | p      |


| motion                    | keymap |
|---------------------------|--------|
| move to start of line     | 0      |
| move \[e\]nd of word      | e      |
| move next \[w\]ord        | w      |
| move start of word        | b      |
| move end of previous word | ge     |
| move to end of line       | $      |


| action                     | keymap   |
|----------------------------|----------|
| cut word                   | diw      |
| cut word and space after   | daw      |
| new line after             | o        |
| new line before            | O        |
| move cursor half page      | ctrl u/d |
| move screen                | ctrl y/e |
| move previous position     | ctrl o   |
| move back                  | ctrl i   |
| close part of code (fold)  | zc       |


| plugin action               | keymap     |
|-----------------------------|------------|
| previous picker             | alt n      |
| next/previous error         | alt b/B    |
| open context menu           | ctrl p     |
| toggle table mode in readme | <leader>tm |
| todos picker                | <leader>st |
| files picker                | <leader>ff |
| grep picker                 | <leader>fw |
| diagnostics picker          | <leader>sd |
| diagnostics in buffer       | <leader>sD |
| buffer structure            | <leader>ft |
| references picker           | gr         |
| go to type definition       | <leader>T  |
| search and replace          | <leader>sr |
| rename variable             | grn        |
| add workspace folder (lsp)  | <leader>wa |
| remove workspace folder     | <leader>wa |
| list code actions           | <leader>ca |
| list sessions               | <leader>ws |


# TODO

- https://github.com/mikavilpas/blink-ripgrep.nvim
- https://github.com/sphamba/smear-cursor.nvim
- https://github.com/Aloxaf/fzf-tab
- vertical buffer list (barbar)
- fix markdown paragraphs
- fyler.nvim
- nvim-lsp-file-operations
