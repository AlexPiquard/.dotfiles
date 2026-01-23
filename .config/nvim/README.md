# help

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
| create vertical split      | ctrl-w v |
| create horizontal split    | ctrl-w s |
| new tab                    | alt n    |
| close tab                  | alt k    |
| previous tab               | alt ,    |
| next tab                   | alt ;    |


| plugin action               | keymap     |
|-----------------------------|------------|
| next/previous error         | alt b/B    |
| open context menu           | ctrl p     |
| toggle table mode in readme | <leader>tm |
| todos picker                | <leader>st |
| files picker                | <leader>ff |
| previous picker             | <leader>fr |
| grep picker                 | <leader>fw |
| buffers picker              | <leader>,  |
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
| delete session              | <leader>wd |
| lazygit                     | <leader>lg |
| git log file                | <leader>gf |
| git log                     | <leader>gl |
| git log line                | <leader>gL |
| git diff                    | <leader>gd |
| git reset hunk              | <leader>hr |
| git reset buffer            | <leader>hR |
| git preview hunk            | <leader>hp |
| git blame                   | <leader>hb |
| bookmarks (arrow)           | q          |
| buffer bookmarks (arrow)    | m          |


## surround/delimiters

using vim-surround

### add


| action              | keymap          |
|---------------------|-----------------|
| yank surround (add) | ys<...>         |
| word                | ys<i/a>**w**<.> |
| paragraph           | ys<i/a>**p**<.> |
| line                | yss<.>          |


### delete


| action                      | keymap |
|-----------------------------|--------|
| delete surround             | ds<.>  |
| delete balanced parenthesis | ds%    |


### change


| action          | keymap          |
|-----------------|-----------------|
| change surround | cs<actual><new> |


### visual mode


| action   | keymap |
|----------|--------|
| Surround | S<.>   |


### special notes 

**(** adds a space and not **)**

use **b** instead of **)**

use **B** instead of **}**

# TODO

- fix markdown paragraphs
- fyler.nvim
- no colors in custom lsp hover
- blink-ripgrep completions appear before lsp completions
- snacks.scratch
- https://github.com/chrisgrieser/nvim-scissors
- something detecting malicious/dangerous code when opening project (eval, etc)
