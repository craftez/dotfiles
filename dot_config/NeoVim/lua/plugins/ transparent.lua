return {
  'xiyaowong/transparent.nvim',
  config = function()
    require("transparent").setup {
      extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
      }
    }

    require('transparent').clear_prefix('BufferLine')
    require('transparent').clear_prefix('NeoTree')
    require('transparent').clear_prefix('lualine')
  end
}
