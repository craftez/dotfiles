local M = {
  "xiyaowong/transparent.nvim",
}

function M.config()
  require("transparent").setup({
    extra_groups = {
      "NormalFloat",
      "NvimTreeNomal",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
    },
  })
end

return M
