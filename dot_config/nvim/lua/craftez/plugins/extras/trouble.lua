local prefix = "<leader>x"

return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{ prefix, desc = "Trouble" },
		{ prefix .. "X", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
		{ prefix .. "x", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics" },
		{ prefix .. "q", "<CMD>TroubleToggle quickfix<CR>", desc = "Quickfix List (Trouble)" },
	},
	opts = {
		use_diagnostic_signs = true,
		action_keys = {
			close = { "q", "<esc>" },
			cancel = "<C-e>",
		},
	},
}
