-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Oil.nvim
map("n", "-", "<cmd>Oil<cr>", { desc = "Open oil.nvim" })
map("n", "<leader>-", function()
  require("oil").toiggle_float()
end, { desc = "Open parent directory in floating window" })

-- mini.nvim
map("n", "<leader>C", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- some utilities
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and Replace RegExp" })
map("n", "tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>n", "<cmd>noh", { desc = "Remove highlight of search matches" })

-- utilities to center the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- visual
map("v", "p", "_dP")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- moving lines
map("x", "J", ":m '>+1<cr>gv=gv")
map("x", "K", ":m '>-1<cr>gv=gv")
