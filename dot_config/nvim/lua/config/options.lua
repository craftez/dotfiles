-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.exrc = true -- per-project configuration
opt.conceallevel = 0

opt.foldlevel = 99 -- Using ufo provider need a large value
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "0"
opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",

  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
