local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  local mappings = {
    ["q"] = { "<cmd>confirm q<CR>", "Quit" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

    b = {
      name = "Buffers",
      b = { "<cmd>Telescope buffers previewer=false<CR>", "Find" },
    },
    f = {
      name = "Find",
      b = { "<CMD>Telescope git_branches<CR>", "Checkout branch" },
      c = { "<CMD>Telescope colorscheme<CR>", "Colorscheme" },
      f = { "<CMD>Telescope find_files<CR>", "Find files" },
      p = { "<CMD>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
      t = { "<CMD>Telescope live_grep<CR>", "Find Text" },
      s = { "<CMD>Telescope grep_string<CR>", "Find String" },
      h = { "<CMD>Telescope help_tags<CR>", "Help" },
      H = { "<CMD>Telescope highlights<CR>", "Highlights" },
      i = { "<CMD>lua require('telescope').extensions.media_files.media_files()<CR>", "Media" },
      l = { "<CMD>Telescope resume<CR>", "Last Search" },
      M = { "<CMD>Telescope man_pages<CR>", "Man Pages" },
      r = { "<CMD>Telescope oldfiles<CR>", "Recent File" },
      R = { "<CMD>Telescope registers<CR>", "Registers" },
      k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
      C = { "<CMD>Telescope commands<CR>", "Commands" },
    },
    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<CR>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<CR>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause()<CR>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
      q = { "<cmd>lua require'dap'.close()<CR>", "Quit" },
      U = { "<cmd>lua require'dap'.toggle({reset = true})<CR>", "Toggle UI" },
    },
    p = {
      name = "Plugins",
      i = { "<cmd>Lazy install<CR>", "Install" },
      s = { "<cmd>Lazy sync<CR>", "Sync" },
      S = { "<cmd>Lazy clear<CR>", "Status" },
      c = { "<cmd>Lazy clean<CR>", "Clean" },
      u = { "<cmd>Lazy update<CR>", "Update" },
      p = { "<cmd>Lazy profile<CR>", "Profile" },
      l = { "<cmd>Lazy log<CR>", "Log" },
      d = { "<cmd>Lazy debug<CR>", "Debug" },
    },
    t = {
      name = "Tab",
      t = {
        "<CMD>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<CR>",
        "Find Tab",
      },
      a = { "<CMD>$tabnew<CR>", "New Empty Tab" },
      A = { "<CMD>tabnew %<CR>", "New Tab" },
      n = { "<CMD>tabn<CR>", "Next" },
      o = { "<CMD>tabonly<CR>", "Only" },
      p = { "<CMD>tabp<CR>", "Prev" },
      h = { "<CMD>-tabmove<CR>", "Move Left" },
      l = { "<CMD>+tabmove<CR>", "Move Right" },
    },
  }

  local opts = {
    mode = "n",   -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  local vmappings = {
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    },
  }

  local vopts = {
    mode = "v",   -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local which_key = require("which-key")

  which_key.setup({
    plugins = {
      marks = false,  -- shows a list of your marks on ' and `
      registers = false, -- show your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      }, -- use which-key for spelling hints
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual keybindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false,  -- adds help for motions
        text_objects = false, -- help for text objects triggered after entring an operator
        windows = false,  -- default bindings on <C-w>
        nav = false,      -- misc bindings to work with windows
        z = false,        -- bindings for holds, spelling and others prefixed with z
        g = false,        -- bindings for prefixed with g
      },
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded",    -- none, single, double, shadow
      position = "bottom",   -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },                                           -- min and max height of the columns
      width = { min = 20, max = 50 },                                           -- min and max width of the columns
      spacing = 3,                                                              -- spacing between columns
      align = "left",                                                           -- align columns left, center or right
    },
    ignore_missing = true,                                                      -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                           -- show help message on the command line when the popup is visible
    show_keys = true,                                                           -- show the currently pressed key and its label as a message in the command line
    triggers = "auto",                                                          -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
end

return M
