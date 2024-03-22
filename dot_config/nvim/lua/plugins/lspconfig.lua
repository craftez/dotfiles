return {
  -- Improved ltex integration, supporting code actions
  { "barreiroleo/ltex-extra.nvim", dependencies = { "neovim/nvim-lspconfig" } },
  -- add various LSP to lspconfig
  {
    "neovim/nvim-lspconfig",
    version = false,
    opts = {
      diagnostics = {
        virtual_text = true,
      },
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      servers = {
        -- use LanguageTool via ltex for spell checking
        ltex = {
          filetypes = {
            "bib",
            "gitcommit",
            "latex",
            "mail",
            "markdown",
            "norg",
            "org",
            "pandoc",
            "rst",
            "text",
          },
          settings = {
            -- https://valentjn.github.io/ltex/settings.html
            ltex = {
              language = "en-US",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "es",
              },
            },
          },
        },
      },
      setup = {
        ltex = function(_, opts)
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client.name == "ltex" then
                require("ltex_extra").setup({
                  load_langs = { "en-US", "es" }, -- languages for witch dictionaries will be loaded
                  init_check = true, -- whether to load dictionaries on startup
                  path = vim.fn.stdpath("config") .. "/spell", -- path to store dictionaries.
                  log_level = "none", -- "none", "trace", "debug", "info", "warn", "error", "fatal"
                })
              end
            end,
          })
        end,
      },
    },
  },
}
