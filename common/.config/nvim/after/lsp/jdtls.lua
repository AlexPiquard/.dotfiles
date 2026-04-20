-- Change used jdtls command to use java 21
local jdtlsCmd = {
	"jdtls",
	-- "-configuration",
	-- os.getenv("HOME") .. "/.cache/jdtls/config",
	-- "-data",
	-- os.getenv("HOME") .. "/.cache/jdtls/workspace",
	"--java-executable",
	vim.env.HOME .. "/.local/share/mise/installs/java/21.0.2/bin/java",
}

return {
	-- for lombok, add in .zshrc
	-- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
	cmd = jdtlsCmd,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = vim.env.HOME .. "/.local/share/mise/installs/java/17.0.2/bin/java",
					},
				},
			},
		},
	},
}
