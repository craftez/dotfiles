return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")

		-- graphql
		lspconfig.graphql.setup({
			filetypes = {
				"graphql",
				"gql",
			},
		})

		-- lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- Prisma
		lspconfig.prismals.setup({})

		-- Java
		lspconfig.jdtls.setup({
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "Homebrew-Java",
								path = "/opt/homebrew/opt/openjdk",
								default = true,
							},
						},
					},
				},
			},
		})
	end,
}
