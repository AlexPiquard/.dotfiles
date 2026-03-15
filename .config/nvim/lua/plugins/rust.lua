return {
    -- Supercharge the rust experience
	"mrcjkb/rustaceanvim",
	version = "^8",
	lazy = false, -- This plugin is already lazy
	init = function()
		vim.g.rustaceanvim = {
            tools = {
                float_win_config = {
                    auto_focus = false
                }
            }
        }
	end,
    -- keymaps are in after/ftplugin/rust.lua
    -- use "MasonInstall codelldb" for debugger to work
}
