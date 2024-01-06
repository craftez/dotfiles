local M = {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {                          -- Optional
      "williamboman/mason.nvim",
      dependencies = {
        { "williamboman/mason-lspconfig.nvim" }, -- Optional
      },
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
      config = function()
        local servers = {
          "astro",
          "bashls",
          "cssls",
          "dockerls",
          "elixirls",
          "eslint",
          "graphql",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "pylsp",
          "pyright",
          "solargraph",
          "sqlls",
          "tailwindcss",
          "tflint",
          "tsserver",
          "yamlls",
          "emmet_language_server",
          "emmet_ls"
        }

        require("mason").setup({
          ui = {
            border = "rounded",
          },
        })
        require("mason-lspconfig").setup({
          ensure_installed = servers,
        })
      end,
    },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },   -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "L3MON4D3/LuaSnip" },   -- Required
    { "rafamadriz/friendly-snippets" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "nvim-treesitter/nvim-treesitter" },
    { "windwp/nvim-ts-autotag" },
    { "windwp/nvim-autopairs" },
    { "jose-elias-alvarez/nvim-lsp-ts-utils" }
  },
}

function M.config()
  local lsp = require("lsp-zero")
  lsp.preset("recommended")

  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })

  cmp.setup({
    mapping = cmp_mappings,
  })
  -- lsp.setup_nvim_cmp({
  --	mapping = cmp_mappings,
  -- })

  lsp.on_attach(function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    keymap(bufnr, "n", "<leader>vd", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap(bufnr, "n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap(bufnr, "n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap(bufnr, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  end)

  require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()

  local cmp_action = require("lsp-zero").cmp_action()

  require("luasnip.loaders.from_vscode").lazy_load()

  -- `/` cmdline setup.
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- `:` cmdline setup.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }),
  })

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip", keyword_length = 2 },
      { name = "buffer",  keyword_length = 3 },
      { name = "path" },
    },
    mapping = {
      ["<C-f>"] = cmp_action.luasnip_jump_forward(),
      ["<C-b>"] = cmp_action.luasnip_jump_backward(),
      ["<Tab>"] = cmp_action.luasnip_supertab(),
      ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    },
  })
end

return M
