return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier_d", "eslint_d" },
        typescript = { "prettier_d", "eslint_d" },
        javascriptreact = { "prettier_d", "eslint_d" },
        typescriptreact = { "prettier_d", "eslint_d" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "yarn test --",
          jestConfigFile = "jest.unit.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
