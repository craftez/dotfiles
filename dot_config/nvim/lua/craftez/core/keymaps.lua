local keymap = require("craftez.core.utils").keymap

keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Better window navigation (using alt with zellij)
-- keymap("n", "<A-h>", "<C-w>h")
-- keymap("n", "<A-j>", "<C-w>j")
-- keymap("n", "<A-k>", "<C-w>k")
-- keymap("n", "<A-l>", "<C-w>l")

-- Split window management
keymap("n", "<leader>sv", "<C-w>v")     -- split window vertical
keymap("n", "<leader>s-", "<C-w>s")     -- split window horizontally
keymap("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close split window
keymap("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
keymap("n", "<leader>sk", "<C-w>+")     -- make split window height taller
keymap("n", "<leader>sl", "<C-w>>5")    -- make split window width bigger
keymap("n", "<leader>sh", "<C-w><5")    -- make split window width smaller

keymap("n", ";", ":")

keymap("n", "<leader>b", ":Telescope buffers<CR>")
-- Unhighlight search --
keymap("n", "<leader>chl", ":nohl<CR>")

-- Insert blank line above and below current line
keymap("n", "<leader>o", "m`o<Esc>``")
keymap("n", "<leader>O", "m`O<Esc>``")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Toggle Word Wrap
keymap("n", "<leader>tw", ":set wrap!<CR>")

-- keep cursor in place when appending below line to current line
keymap("n", "J", "mzJ`z")

-- Keep search term in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Keep current buffer when pasting over text
keymap("n", "<leader>p", '"_dP')

-- Worst place in the universe
keymap("n", "Q", "<nop>")

-- Make current file executable
keymap("n", "<leader>x", ":w !chmod +x %<CR>")

-- Find / Replace Current Word
keymap("n", "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")


-- Move line up/down
keymap("n", "<leader>j", "ddp")
keymap("n", "<leader>k", "ddkP")

-- Better Ctrl u | d
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- MACROS
keymap("n", "Q", "@qj")
keymap("x", "Q", ":norm @q<CR>gv")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Visual search --
keymap("v", "//", 'y/<C-R>"<CR>')

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "V", ":m '>-2<CR>gv=gv")
-- keymap("v", "<A-j>", ":m .+1<CR>==")
-- keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- tmux-navigator --
-- keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
-- keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
-- keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
-- keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- reload current file --
keymap("n", "<leader>r", "<cmd>e!")

-- Quickfix keymaps
keymap("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap("n", "<leader>qp", ":cprev<CR>") -- jump to previous quickfix list item

