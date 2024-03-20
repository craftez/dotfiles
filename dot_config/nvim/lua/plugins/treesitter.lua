return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-context', opts = { mode = "topline" } },
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(_, bufnr)
            -- treesitter highlighting seems to have trouble with large files. Partially disussed
            -- (but not really resolved) at https://github.com/nvim-treesitter/nvim-treesitter/issues/556
            return vim.api.nvim_buf_line_count(bufnr) > 100000
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    keys = {
      { "<leader>ut", "<CMD>TSContextToggle<CR>", desc = "Toggle treesitter context" },
    },
    opts = {
      line_numbers = false,
      max_lines = 4,
      mode = "topline",
      trim_scope = "inner"
    }
  }
}
