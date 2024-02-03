vim.g.mapleader = " " -- change leader to a space
vim.g.maplocalleader = " " -- change localleader to a space

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- disable netrw

local opt = vim.opt

opt.incsearch = true -- make search act like search in modern browsers
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- popup menu height
opt.showmode = false -- we dont need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.smartcase = true -- smartcase
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 2
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.cursorline = false -- highlight the current line
opt.number = true -- set numbered lines
opt.breakindent = true -- wrap lines with indent
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 2 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 5 -- Makes sure there are always eight lines of context
opt.sidescrolloff = 5 -- Makes sure there are always eight lines of context
opt.showcmd = false -- Don't show the command in the last line
opt.ruler = false -- Don't show the ruler
-- opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
opt.title = true -- set the title of window to the value of the titlestring
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.fillchars = { eob = " " } -- change the character at the end of buffer

-- vim.opt.cursorlineopt = "number"              -- set the cursorline
-- vim.opt.tabstop = 2                           -- insert 2 spaces for a tab
-- vim.opt.laststatus = 0                          -- Always display the status line
