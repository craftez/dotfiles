return {
  { "kdheepak/lazygit.nvim" },
  {
    "lewis6991/gitsigns.nvim"
  },
  { "tveskag/nvim-blame-line" },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- not git, but it's okay
  "mbbill/undotree",
}
