return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false,
    date_format = "%m/%d/%y %H:%M:%S",
  },
  config = function(_, opts)
    require("gitblame").setup(opts)
    local utils = require("utils")
    utils.keymap("n", "<leader>bt", ":GitBlameToggle<CR>", { desc = "Git blame" }) -- toggle git blame
  end,
}
