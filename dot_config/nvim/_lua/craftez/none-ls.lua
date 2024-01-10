local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.mix,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.credo,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.codespell,
    },
  })

  local wk = require("which-key")
  wk.register({
    l = {
      name = "LSP",
      a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<CMD>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Buffer Diagnostics" },
      w = { "<CMD>Telescope diagnostics<CR>", "Diagnostics" },
      f = {
        "<CMD>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<CR>",
        "Format",
      },
      i = { "<CMD>LspInfo<CR>", "Info" },
      I = { "<CMD>Mason<CR>", "Mason Info" },
      K = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Open Diagnostics Float" },
      j = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      k = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
      l = { "<CMD>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
      q = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
      r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
      s = { "<CMD>Telescope lsp_document_symbols<CR>", "Document Symbols" },
      S = { "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "Worksplace Symbols" },
      e = { "<CMD>Telescope quickfix<CR>", "Telescope Quickfix" },
    },
  }, { prefix = "<leader>" })
end

return M
