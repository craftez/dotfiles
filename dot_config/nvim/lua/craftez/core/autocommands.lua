vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "bufcheck",
	pattern = vim.env.MYVIMRC,
	command = "silent source %",
})

local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
