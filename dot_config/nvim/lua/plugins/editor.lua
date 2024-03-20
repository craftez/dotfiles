return {
  { "folke/flash.nvim",                              enabled = false }, -- disable search labels

  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk" },
    },
  },

  { -- Toggle, display, and navigate marks
    "chentoast/marks.nvim",
    keys = {
      { "<leader>um", "<cmd>MarksToggleSigns<cr>", desc = "Toggle marks" },
    },
    event = "VeryLazy",
    config = true,
  },

  {
    "folke/which-key.nvim",
    module = "which-key",
    opts = {
      icons = {
        separator = "",
      },
      window = {
        border = "single",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    "RRethy/vim-illuminate",
    keys = {
      { "<c-n>", function() require("illuminate").goto_next_reference(false) end, desc = "Next reference" },
      { "<c-p>", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev reference" },
      { "[[",    false },
      { "]]",    false },
    },
    opts = {
      filetypes_denylist = { "dirbuf", "dirvish", "fugitive", "tailscale" },
    },
    -- override config in LazyVim to prevent [[ and ]] keymaps
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "plenary.nvim",
    opts = {
      highlight = {
        pattern = {
          [[.*<(KEYWORDS)\s*:]],
          [[.*<(KEYWORDS)\(.*\)\s*:]], -- handle KEYWORD(name):
        },
        keyword = "fg",
        after = "",
      },
      search = {
        pattern = [[\b(KEYWORDS)(\(.*\))?:]],
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown preview" },
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      cycle_results = false,
    },
  },

  {
    "stevearc/qf_helper.nvim",
    opts = {
      quickfix = {
        default_bindings = false,
      },
    },
  },

  { -- Undo history visualizer
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<Cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
    },
  },

  { import = "lazyvim.plugins.extras.editor.outline" },

  {
    "CRAG666/betterTerm.nvim",
    event = "VeryLazy",
    opts = function()
      local betterTerm = require("betterTerm")
      vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    event = "LazyFile",
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          ["<R>"] = { name = "+Run" },
        },
      },
    },
    config = true,
    opts = {
      mode = "term",
      startinsert = true,
      filetype = {
        python = "python3 -u",
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        typescript = "deno run",
      },
      term = {
        position = "bot", -- horiz, top, vert
        size = 18,
      },
      float = {
        border = "rounded",
        close_key = "<ESC>",
        blend = 0,
      },
    },
    keys = {
      { "RK", "<cmd>RunFile float<cr>",                       desc = "Run Code in Float" }, -- K --> up --> floating window
      { "R",  "<cmd>RunFile term<cr>",                        desc = "Run Code" },          -- K --> up --> floating window
      { "RJ", "<cmd>RunFile term<cr>",                        desc = "Run Code in Term" },  -- J --> down --> bottom split
      { "RL", "<cmd>RunFile term<cr><cmd>windo wincmd L<cr>", desc = "Run Code in Term" },  -- J --> down --> bottom split
    },
  }
}
