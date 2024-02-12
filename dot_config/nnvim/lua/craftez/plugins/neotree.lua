return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
  keys = {
    { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float file explorer" },
    { "<leader><tab>", ":Neotree toggle right<CR>", silent = true, desc = "Right file explorer" },
  },
  config = function()
    require("neo-tree").setup()
  end
}
