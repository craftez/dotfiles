local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "craftez.plugins" },
	{ import = "craftez.plugins.extras" },
}, {
	install = {
		missing = true,
		colorscheme = { "habamax" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detector = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded",
	},
})
