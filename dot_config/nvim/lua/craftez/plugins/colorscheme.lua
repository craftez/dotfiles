local M = {
  -- "LunarVim/primer.nvim",
  -- "rebelot/kanagawa.nvim",
  "craftzdog/solarized-osaka.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = function()
    return {
      transparent = true,
    }
  end,
}

return M
