local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		{
			"windwp/nvim-ts-autotag",
		},
		{
			"windwp/nvim-autopairs",
		},
	},
	opts = {
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"elixir",
			"heex",
			"eex",
		},
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	},
}

function M.config(_, opts)
	require("nvim-treesitter.configs").setup(opts)

	local wk = require("which-key")
	wk.register({
		name = "Treesitter",
		T = {
      i = { ":TSConfigInfo<CR>", "Info" }
    }
	})
end

return M
