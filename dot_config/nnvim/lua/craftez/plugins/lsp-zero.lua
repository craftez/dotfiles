return {
  {
    "folke/neodev.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("neodev").setup {
        library = { plugins = { "neotest" }, types = true }
      }
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- Lsp Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
      -- Adds vscode-like pictograms
      "onsails/lspkind.nvim",

      -- Others
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local nmap = require("craftez.config.utils").nmap
      lsp_zero.on_attach(function(_client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })

        nmap("gd", require("telescope.builtin").lsp_definitions, { desc = "Go to Definition" })
        nmap("gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
        nmap("gi", require("telescope.builtin").lsp_implementations, { desc = "Goto Implementation" })
        nmap("go", require("telescope.builtin").lsp_type_definitions, { desc = "Type Definition" })
        nmap("gl", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })
        nmap("K", vim.lsp.buf.hover, { desc = "Hove Documentation" })
        nmap("gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
        nmap("<leader>v", "<CMD>vsplit | lua vim.lsp.buf.definition()<CR>",
          { desc = "Goto Definition in Vertical Split" })
      end)

      require("mason").setup({
        ensure_installed = {
          -- lua
          "lua-language-server",
          "stylua",
          -- python
          "pyright",
          "black",
          "isort",
          "ruff",
          "mypy",
          "debugpy",
          -- web
          "typescript-language-server",
          "css-lsp",
          "tailwindcss-language-server",
          "eslint-lsp",
          "prettierd",
          -- c/c++
          "clangd",
          --java
          "jdtls",
          "google-java-format"
        }
      })
      require("mason-lspconfig").setup {
        ensure_installed = {
          'tsserver',
          'lua_ls',
          'eslint',
          'emmet_ls',
          'html',
          'cssls'
        },
        handlers = {
          lsp_zero.default_setup,
        },
      }

      local cmp = require('cmp')
      local cmp_format = require("lsp-zero").cmp_format()

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      local cmp_mappings = lsp_zero.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      cmp_mappings['<Tab>'] = nil
      cmp_mappings['<S-Tab>'] = nil

      require('luasnip.loaders.from_vscode').lazy_load()
      local luasnip = require('luasnip')
      luasnip.setup()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          -- { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "calc" },
          { name = "emoji" },
          { name = "treesitter" },
        },
        mapping = cmp_mappings,
        formatting = cmp_format
      }

      lsp_zero.setup()
    end
  },
  {
    "stevearc/conform.nvim",
    version = "*",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ timeout_ms = 10000, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format Buffer"
      }
    },
    config = function()
      local slow_format_filetypes = {}
      local opts = {
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end

          local function on_format(err)
            if err and err:match("timeout$") then
              slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
          end

          return { timeout_ms = 200, lsp_fallback = true }, on_format
        end,

        format_after_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end
          return { lsp_fallback = true }
        end,
        formatters_by_ft = {
          javascript = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          python = { "isort", "black" },
          lua = { "stylua" },
          java = { "google_java_format" },
          rust = { "rust-analyzer" },
        },
        formatters = {
          google_java_format = {
            command = "google-java-format",
          },
        },
      }

      --- Create user commands to quickly enable/disable autoformatting
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disbale formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Re-enable autoformat-on-save" })

      require("conform").setup(opts)
    end,
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", "InsertEnter" },
    config = function()
      local lint = require("lint")
      table.insert(lint.linters.mypy.args, "--ignore-missing-imports")
      local new_ruff_args = { "--ignore", "E741" }
      for i = 1, #new_ruff_args do
        lint.linters.ruff.args[#lint.linters.ruff.args + 1] = new_ruff_args[i]
      end

      lint.linters_by_ft = {
        python = { "mypy", "ruff" },
      }

      vim.api.nvim_create_autocmd({
        "BufEnter", "BufWritePost", "InsertLeave", "TextChanged"
      }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          lint.try_lint()
        end
      })
    end
  },
  -- inlay hints feature that's going to be native in Neovim 0.10 but not yet in 0.9
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = { "LspAttach" },
    config = function()
      local inlay = require("lsp-inlayhints")
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          inlay.on_attach(client, bufnr)
        end,
      })
      vim.keymap.set("n", "<leader>h", function()
        inlay.toggle()
      end, { desc = "Toggle inlay hints" })
      inlay.setup()
    end,
  },
}
