local function set_theme(name)
	vim.cmd("colorscheme " .. name)
end

return {
	"f-person/auto-dark-mode.nvim",
	event = "VeryLazy",
	cond = function ()
		local cmd = "dbus-send --session --print-reply=literal --reply-timeout=1000 --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.portal.Settings.Read string:org.freedesktop.appearance string:color-scheme"

		local result = vim.fn.system(cmd)
		return result:match("uint32%s+1") or result:match("uint32%s+[02]")
	end,
	opts = {
		set_dark_mode = function()
			set_theme("tokyonight-moon")
		end,
		set_light_mode = function()
			set_theme("tokyonight-day")
		end,
		update_interval = 1000,
	},
}
