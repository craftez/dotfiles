local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

kmap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocaleader = " "

kmap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
kmap("n", "<C-i>", "<C-i>", opts)

-- use jk to exit insert mode
kmap("i", "jk", "<ESC>", { desc = "Exit insert mode with 'jk'" })

-- clear search highlights
kmap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete a word backwards
-- kmap("n", "dw", 'vb"_d')

-- Select all
kmap("n", "<C-a>", "gg<S-v>G")

-- Better window navigation
kmap("n", "<m-tab>", "<c-6>", opts)
kmap("n", "ss", ":split<CR>", opts) -- Split window
kmap("n", "sv", ":vsplit<CR>", opts)

-- Move window
kmap("n", "sh", "<C-w>h")
kmap("n", "sj", "<C-w>j")
kmap("n", "sk", "<C-w>k")
kmap("n", "sl", "<C-w>l")

-- Resize window
kmap("n", "<C-w><left>", "<C-w><")
kmap("n", "<C-w><right>", "<C-w>>")
kmap("n", "<C-w><up>", "<C-w>+")
kmap("n", "<C-w><down>", "<C-w>-")
-- <C-w>= to make them equal

-- Buffer navigation
kmap("n", "[b", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })
kmap("n", "]b", "<CMD>bnext<CR>", { desc = "Next Buffer" })

-- Better viewing
kmap("n", "n", "nzzzv", opts)
kmap("n", "N", "Nzzzv", opts)
kmap("n", "*", "*zz", opts)
kmap("n", "#", "#zz", opts)
kmap("n", "g*", "g*zz", opts)
kmap("n", "g#", "g#zz", opts)
kmap("n", "g,", "g,zvzz")
kmap("n", "g;", "g;zvzz")

-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Paste over currently selected text without yanking it
kmap("v", "p", [["_dP]])

-- Move lines
kmap("n", "<A-j>", ":m .+1<CR>==")
kmap("v", "<A-j>", ":m '>+1<CR>gv=gv")
kmap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
kmap("n", "<A-k>", ":m .-2<CR>==")
kmap("v", "<A-k>", ":m '<-2<CR>gv=gv")
kmap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

kmap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
kmap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
