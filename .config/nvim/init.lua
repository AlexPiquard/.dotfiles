vim.g.mapleader = " "

-- Copies in nvim applies to system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

vim.o.termguicolors = true

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.cmd.colorscheme("vim")
