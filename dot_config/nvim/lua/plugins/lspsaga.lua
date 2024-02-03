return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local map = vim.keymap.set

		require("lspsaga").setup({
			ui = {
				border = "rounded",
			},
			lightbulb = {
				enable = false,
			},
		})

		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")

		local builtin = require("telescope.builtin")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
				vim.keymap.set("n", "gr", builtin.lsp_references, opts)
			end,
		})

		local wk = require("which-key")
		wk.register({
			l = {
				name = "+LSP",
				-- a = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
				a = { vim.lsp.buf.code_action, "Code Action" },
				A = { vim.lsp.buf.range_code_action, "Range Code Actions" },
				s = { vim.lsp.buf.signature_help, "Display Signature Information" },
				r = { vim.lsp.buf.rename, "Rename all References" },
				f = { vim.lsp.buf.format, "Format" },
				i = { builtin.lsp_implementations, "Implementation" },
				l = { "<CMD>TroubleToggle document_diagnostics<CR>", "Document Diagnostics (Trouble)" },
				L = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics (Trouble)" },
				w = { builtin.diagnostics, "Diagnostics" },
				k = { "<CMD>Lspsaga hover_doc<CR>", "Hover Doc" },
				o = { "<CMD>Lspsaga outline<CR>", "LspSaga Outline" },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})

		-- error lens
		vim.fn.sign_define({
			{
				name = "DiagnosticSignError",
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "ErrorLine",
			},
			{
				name = "DiagnosticSignWarn",
				text = "",
				texthl = "DiagnosticSignWarn",
				linehl = "WarningLine",
			},
			{
				name = "DiagnosticSignInfo",
				text = "",
				texthl = "DiagnosticSignInfo",
				linehl = "InfoLine",
			},
			{
				name = "DiagnosticSignHint",
				text = "",
				texthl = "DiagnosticSignHint",
				linehl = "HintLine",
			},
		})
	end,
}
