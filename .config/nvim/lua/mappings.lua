require "nvchad.mappings"
local gitsigns = require("gitsigns")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map('n', '<leader>db', function()
	require("dbee").open()
end, { desc = "Open database terminal", noremap = false})

map("n", "<A-n>", function() require("telescope.builtin").resume() end, { desc = "Resume Telescope items"})

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left"})
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down"})
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up"})
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right"})

map("n", "<A-b>", vim.diagnostic.goto_next)
map("n", "<A-S-b>", vim.diagnostic.goto_prev)

-- gitsigns
map('n', '<leader>hs', gitsigns.stage_hunk)
map('n', '<leader>hr', gitsigns.reset_hunk)
map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('n', '<leader>hS', gitsigns.stage_buffer)
map('n', '<leader>hu', gitsigns.undo_stage_hunk)
map('n', '<leader>hR', gitsigns.reset_buffer)
map('n', '<leader>hp', gitsigns.preview_hunk)
map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
map('n', '<leader>hd', gitsigns.diffthis)
map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
map('n', '<leader>td', gitsigns.toggle_deleted)
