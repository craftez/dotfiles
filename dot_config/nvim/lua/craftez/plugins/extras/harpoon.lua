local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	keymap("n", "<s-m>", "<CMD>lua require('craftez.plugins.extras.harpoon').mark_file()<CR>", opts)
	keymap("n", "<TAB>", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
end

function M.mark_file()
	require("harpoon.mark").add_file()
	vim.notify("󱡅  marked file")
end

return M
