return {
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    { "<leader>hm", "<CMD>lua require('harpoon.mark').add_file()<CR>", desc = "Mark file with harpoon" },
    { "<leader>hn", "<CMD>lua require('harpoon.ui').nav_next()<CR>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<CMD>lua require('harpoon.ui').nav_prev()<CR>", desc = "Go to previous harpoon mark" },
    { "<leader>ha", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show harpoon marks" },
  },
}
