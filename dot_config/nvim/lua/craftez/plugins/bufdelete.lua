return {
	"famiu/bufdelete.nvim",
	event = "VeryLazy",
	config = function()
		local kmap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		kmap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<CR>", opts)
	end,
}
