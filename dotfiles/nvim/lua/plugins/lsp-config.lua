return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- import mason
      local mason = require("mason")

      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason
      mason.setup()

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          "lua_ls",
          "cssls",
          "dockerls",
          "elixirls",
          "erlangls",
          "graphql",
          "html",
          "jsonls",
          "tsserver",
          "sqlls",
          "yamlls",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true,
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "black",
          "eslint_d",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      local servers =
      { "lua_ls", "cssls", "dockerls", "graphql", "html", "jsonls", "tsserver", "sqlls", "yamlls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      lspconfig.elixirls.setup({
        cmd = { "/Users/eduardozamora/.elixir-ls/release/language_server.sh" },
        capabilities = capabilities,
      })

      local opts = {}
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>d[", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>d]", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>dd", ":Telescope diagnostics<CR>", opts)
    end,
  },
}
