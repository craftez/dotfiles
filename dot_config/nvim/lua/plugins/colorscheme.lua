return {
  -- add gruvbox
  "ellisonleao/gruvbox.nvim",
  "bluz71/vim-nightfly-colors",
  "rebelot/kanagawa.nvim",
  "NLKNguyen/papercolor-theme",
  "romainl/Apprentice",
  -- configure lazyvim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "PaperColor",
      -- apprentice, PaperColor, kanagawa, nightfly, gruvbox
    },
  },
}
