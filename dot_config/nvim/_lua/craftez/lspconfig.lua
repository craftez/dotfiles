local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "b0o/schemastore.nvim",
  },
}

function M.config()
  local lsp_zero = require "lsp-zero"
  local lspconfig = require "lspconfig"
  local schemastore = require "schemastore"
  local cmp = require "cmp"
  local cmp_format = lsp_zero.cmp_format()

  cmp.setup {
    sources = {
      -- {name = "copilot"}
      { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete()
    }),
    formatting = cmp_format,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
  }

  lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps {
      buffer = bufnr,
      preserve_mappings = false,
    }
  end)

  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "clangd",
      "jsonls",
      "yamlls",
      "elixirls",
      "emmet_ls",
      "tsserver",
      "html",
      "cssls"
    },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
      end,
      jsonls = function()
        lspconfig.jsonls.setup {
          settings = {
            json = {
              schemas = vim.list_extend(schemastore.json.schemas(), {
                {
                  fileMatch = { "docker-compose*.json", "compose*.json" },
                  url = { "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" },
                },
              }),
              validate = { enable = true },
            },
          },
        }
      end,
      yamlls = function()
        lspconfig.yamlls.setup {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = schemastore.yaml.schemas(),
            }
          }
        }
      end,
      emmet_ls = function()
        lspconfig.emmet_ls.setup {
          settings = {
            init_options = {
              html = {
                options = {
                  ["bem.enabled"] = true
                }
              }
            }
          }
        }
      end
    }
  }
end

return M
