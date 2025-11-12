local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
-- map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
--
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--   { desc = "telescope find all files" }
-- )

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

local gitsigns = require("gitsigns")

-- add yours here

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("n", "<leader>fm", function()
-- 	require("conform").format()
-- end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- map('n', '<leader>db', function()
-- 	require(".config.nvim.lua.plugins.disabled.dbee").open()
-- end, { desc = "Open database terminal", noremap = false})

-- map("n", "<A-n>", function() require("telescope.builtin").resume() end, { desc = "Resume Telescope items"})

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })

map("n", "<A-b>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "<A-S-b>", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

-- gitsigns
map("n", "<leader>hs", gitsigns.stage_hunk)
map("n", "<leader>hr", gitsigns.reset_hunk)
map("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
map("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
map("n", "<leader>hS", gitsigns.stage_buffer)
map("n", "<leader>hu", gitsigns.undo_stage_hunk)
map("n", "<leader>hR", gitsigns.reset_buffer)
map("n", "<leader>hp", gitsigns.preview_hunk)
map("n", "<leader>hb", function()
	gitsigns.blame_line({ full = true })
end)
map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
map("n", "<leader>hd", gitsigns.diffthis)
map("n", "<leader>hD", function()
	gitsigns.diffthis("~")
end)
map("n", "<leader>td", gitsigns.toggle_deleted)

-- Menus
map("n", "<C-p>", function()
	require("menu.utils").delete_old_menus()

	-- clicked buf
	local buf = vim.api.nvim_get_current_buf()
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, {})
end, {})

-- Menus on rightclick
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()

	vim.cmd.exec('"normal! \\<RightMouse>"')

	-- clicked buf
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})
