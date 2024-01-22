return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent")
    transparent.setup({
      extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
      },
    })

    transparent.clear_prefix("Bufferline")
    transparent.clear_prefix("NeoTree")
    transparent.clear_prefix("lualina")
  end,
}
