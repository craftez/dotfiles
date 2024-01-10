local M = {
  -- "LunarVim/primer.nvim",
  -- "rebelot/kanagawa.nvim",
  "craftzdog/solarized-osaka.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    transparent = true
  }
}

function M.config(_, opts)
  vim.cmd.colorscheme "solarized-osaka" -- "primer_dark"
end

return M
