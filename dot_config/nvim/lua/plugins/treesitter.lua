return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  opts = {
    ensure_installed = "all",
    sync_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    auto_install = true,
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
