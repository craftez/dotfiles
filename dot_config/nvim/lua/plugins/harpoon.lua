local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map("n", "<S-m>", "<CMD>lua require('plugins.harpoon').mark_file()<CR>", opts)
  map("n", "<TAB>", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify("󱡅  marked file")
end

return M
