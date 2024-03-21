return {
  {
    "CRAG666/code_runner.nvim",
    keys = {
      {
        "<leader>rs",
        '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
        desc = "Auto Compile Sass",
      },
      { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" },
      { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
      { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
    },
    config = function()
      require("code_runner").setup({
        filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          typescript = "deno run",
          javascript = "node $fileName",
          rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          -- cpp="gcc $fileName -lstdc++ -o $fileNameWithoutExt && $fileNameWithoutExt"
          cpp = "g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
          scss = "sass $dir/$fileName $dir/$fileNameWithoutExt.css",
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>r"] = { name = "+Run" },
      },
    },
  },
}
