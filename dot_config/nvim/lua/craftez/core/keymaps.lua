-- set leader key to space
vim.g.mapleader = " "

local kmap = vim.keymap.set -- alias

--
-- General Keymaps
--
-- use jk to exit insert mode
kmap("i", "jk", "<ESC>", { desc = "Exit insert mode with 'jk'" })

-- clear search highlights
kmap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- kmap("n", "x", '"_x')

-- increment/decrement numbers
kmap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
kmap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
kmap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
kmap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
kmap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
kmap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split wind

-- tab management
kmap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
kmap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
kmap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
kmap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
kmap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
