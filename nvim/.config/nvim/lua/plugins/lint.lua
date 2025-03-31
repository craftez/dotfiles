return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      elixir = { "credo" },
    },
    linters = {
      credo = {
        cmd = "mix",
        stdin = false,
        args = { "credo", "suggest", "--format", "flycheck", "--read-from-stdin", "%filepath" },
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_errorformat("%f:%l:%c: %t: %m", {
          source = "credo",
          severity = {
            I = vim.diagnostic.severity.INFO,
            R = vim.diagnostic.severity.WARN,
            W = vim.diagnostic.severity.WARN,
            F = vim.diagnostic.severity.ERROR,
          },
        }),
      },
    },
  },
}
