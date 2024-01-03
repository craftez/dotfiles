return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    tag = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbol" })
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { desc = "Show diagnostics" })
      vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "Advanced git search" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find in old files" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep string" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
