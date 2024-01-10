local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("telescope").load_extension("lazygit")
  vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit" })
end

return M
