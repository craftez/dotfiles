return {
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
    },
  },
  { "EdenEast/nightfox.nvim" },
  { "rose-pine/neovim", name = "rose-pine", opts = {
    theme = "dragon",
    transparent = true,
  } },
  { "folke/tokyonight.nvim", branch = "main" },
  { "sainnhe/everforest" },
  { "rebelot/kanagawa.nvim" },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      undercurl = true,
      transparent = true,
      terminal_colors = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        semantic_tokens = true,
        snacks = {
          enabled = true,
          indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
