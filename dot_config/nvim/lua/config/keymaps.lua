-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- quick quit and save
keymap.set("n", "S", ":w<CR>", opt)
keymap.set("n", "Q", ":q<CR>", opt)

-- change tab
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)

-- Split windows
keymap.set("n", "sh", ":split<CR>", opt)
keymap.set("n", "sv", ":vsplit<CR>", opt)

-- Indent
keymap.set("v", ">", ">gv", opt)
keymap.set("v", "<", "<gv", opt)

-- Move current line
keymap.set({ "n", "v", "i" }, "<A-j>", "<CMD>m .+1<CR>", { desc = "Move Down", noremap = true, silent = true })
keymap.set({ "n", "v", "i" }, "<A-k>", "<CMD>m .-2<CR>", { desc = "Move Up", noremap = true, silent = true })

-- Stay centered jumping between search results
keymap.set("n", "n", "nzzzv", { silent = true })
keymap.set("n", "N", "Nzzzv", { silent = true })

-- Search for visually selected text
keymap.set("v", "//", 'y/<C-R>"<CR>', { silent = true })

-- Trouble mappings
keymap.set("n", "<C-q>", "<CMD>TroubleToggle<CR>", { silent = true })
keymap.set("n", "]q", function()
  require("trouble").next({ skip_groups = true, jump = true })
end, { silent = true })
keymap.set("n", "[q", function()
  require("trouble").previous({ skip_groups = true, jump = true })
end, { silent = true })
keymap.set("n", "]Q", function()
  require("trouble").last({ skip_groups = true, jump = true })
end, { silent = true })
keymap.set("n", "[Q", function()
  require("trouble").first({ skip_groups = true, jump = true })
end, { silent = true })

-- Harpoon to quick navigate between filespec
keymap.set("n", "<leader>hm", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon Add File" })
keymap.set("n", "<leader>hr", function()
  require("harpoon.mark").rm_file()
end, { desc = "Harpoon Remove" })
keymap.set("n", "<leader>hl", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon Toggle List" })
