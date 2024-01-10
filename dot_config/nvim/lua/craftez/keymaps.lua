local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

kmap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocaleader = " "

kmap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
kmap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
kmap("n", "<m-h>", "<C-w>h", opts)
kmap("n", "<m-j>", "<C-w>h", opts)
kmap("n", "<m-k>", "<C-w>h", opts)
kmap("n", "<m-l>", "<C-w>h", opts)
kmap("n", "<m-tab>", "<c-6>", opts)

-- Buffer navigation
kmap("n", "[b", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })
kmap("n", "]b", "<CMD>bnext<CR>", {desc = "Next Buffer" })
kmap("n", "<leader>k", ":echo 'Choose a buf to delete (blank to choose curr)'<CR>" .. ":ls<CR>" .. ":bdelete<SPACE>",
{desc = "[K]ill a buffer"})

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

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

kmap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
kmap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
