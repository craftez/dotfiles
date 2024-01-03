local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", {
    silent = true,
    noremap = true,
  }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.create_format_on_save_autocmd = function(augroup_name, bufnr, timeout_ms)
  timeout_ms = timeout_ms or 1000
  local group = vim.api.nvim_create_augroup(augroup_name .. "FormatOnSave", { clear = false })
  vim.api.nvim_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ timeout_ms = timeout_ms })
    end,
    group = group,
  })
end

return M
