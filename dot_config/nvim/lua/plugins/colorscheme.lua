return {
	"neanias/everforest-nvim",
	priority = 1000,
	config = function()
		require("everforest").setup({
			transparent_background = true,
			diagnostic_line_height = 1,
		})
		vim.cmd([[colorscheme everforest]])
	end,
}
