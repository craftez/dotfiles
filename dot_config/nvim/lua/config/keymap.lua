vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<C-a>", "ggVG", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

map("n", "n", "nzzv", opts)
map("n", "N", "Nzzv", opts)
map("n", "*", "*zzv", opts)
map("n", "#", "#zzv", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- Split Management
map("n", "sh", "<C-w>s", { desc = "Split Horizontal" })
map("n", "sv", "<C-w>v", { desc = "Split Vertical" })
map("n", "sc", "<C-w>c", { desc = "Close Split" })
map("n", "sC", "<C-w>o", { desc = "Close Other Splits" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- terminal
map("t", "<C-h>", "<cmd>wincmd h<CR>")
map("t", "<C-j>", "<cmd>wincmd j<CR>")
map("t", "<C-k>", "<cmd>wincmd k<CR>")
map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Resizing Windows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<M-Left>", ":vertical resize -2<CR>", opts)
map("n", "<M-Right>", ":vertical resize +2<CR>", opts)

map("t", "<C-Up>", ":resize -2<CR>", opts)
map("t", "<C-Down>", ":resize +2<CR>", opts)
map("t", "<M-Left>", ":vertical resize -2<CR>", opts)
map("t", "<M-Right>", ":vertical resize +2<CR>", opts)
