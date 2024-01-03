local keymap = require("utils").keymap

-- General Keymaps
keymap("n", "jk", "<ESC>") -- exit insert mode with jk
keymap("i", "jj", "<ESC>") -- exit insert mode with ii
keymap("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap("n", "QQ", ":q!<CR>", { noremap = true }) -- quit without saving
keymap("n", "WW", ":w!<CR>", { noremap = true }) -- save
keymap("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Split window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertical
keymap("n", "<leader>s-", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>") -- close split window
keymap("n", "<leader>sj", "<C-w>-") -- make split window height shorter
keymap("n", "<leader>sk", "<C-w>+") -- make split window height taller
keymap("n", "<leader>sl", "<C-w>>5") -- make split window width bigger
keymap("n", "<leader>sh", "<C-w><5") -- make split window width smaller
keymap("n", "<C-h>", "<C-w>h") -- move to left pane
keymap("n", "<C-l>", "<C-w>l") -- move to right pane
keymap("n", "<C-j>", "<C-w>j") -- move to down pane
keymap("n", "<C-k>", "<C-w>k") -- move to up pane

-- Tab management
keymap("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Quickfix keymaps
keymap("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap("n", "<leader>qp", ":cprev<CR>") -- jump to previous quickfix list item

-- Navigate Buffers
keymap("n", "bk", ":bnext<CR>")
keymap("n", "bj", ":bprevious<CR>")
keymap("n", "bh", ":bfirst<CR>")
keymap("n", "bl", ":blast<CR>")
keymap("n", "bd", ":bdelete<CR>")

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- prevent paste replace
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv")
keymap("x", "K", ":m '<-2<CR>gv=gv")
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv")
