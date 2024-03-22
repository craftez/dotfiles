return {
  { "davidmh/cspell.nvim" },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local cspell = require("cspell")
      table.insert(opts.sources, cspell.diagnostics)
      table.insert(opts.sources, cspell.code_actions)
      opts.fallback_severity = vim.diagnostic.severity.HINT
    end,
  },
}
