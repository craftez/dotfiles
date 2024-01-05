local M = {
  "echasnovski/mini.indentscope",
  version = "*",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    symbol = "┋",
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "nvim-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#FF5555" })
  end,
}

return M
