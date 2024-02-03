return {
	"fedepujol/move.nvim",
	config = function()
		require("move").setup({})
		local opts = { noremap = true, silent = true }
		-- Normal-mode commands
		vim.keymap.set("n", "J", ":MoveLine(1)<CR>", opts)
		vim.keymap.set("n", "K", ":MoveLine(-1)<CR>", opts)
		vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
		vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

		-- Visual-mode commands
		vim.keymap.set("v", "J", ":MoveBlock(1)<CR>", opts)
		vim.keymap.set("v", "K", ":MoveBlock(-1)<CR>", opts)
	end,
}
