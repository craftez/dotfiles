return {
	mode = { "n", "v" },
	-- [";"] = {":Alpha<CR>", "Dashboard"},
	w = { ":w!<CR>", "Save" },
	W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
	q = { ":confirm q<CR>", "Quit" },
	h = { ":nohlsearch<CR>", "No Highlight" },
}
