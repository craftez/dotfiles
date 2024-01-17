M = {}
M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("gd", "<cmd>Telescope lsp_definitions<CR>", "Goto Definition")
  nmap("gr", "<cmd>Telescope lsp_references<CR>", "Goto References")
  nmap("gi", "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation")
  nmap("go", "<cmd>Telescope lsp_type_definitions<CR>", "Type Definition")
  -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap("gl", vim.diagnostic.open_float, "Open Diagnostic Float")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
  -- nmap("<leader>Wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
  -- nmap("<leader>Wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
  -- nmap("<leader>Wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, "Workspace List Folders")

  nmap("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
end

return M
