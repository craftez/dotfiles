return {
  { import = "lazyvim.plugins.extras.lang.java" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "graphql",
        "groovy",
        "kotlin",
        "scala",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gradle_ls = {},
        graphql = {},
        groovyls = {},
        kotlin_language_server = {},
      },
      format = {
        timeout_ms = 5000,
      },
    },
  },
  {
    "williamboma/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ktlint",
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          -- kotlin
          nls.builtins.diagnostics.ktlint,
        })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        kotlin = { "ktlint" },
      },
      format = {
        timeout_ms = 5000,
      },
    },
  },
}
