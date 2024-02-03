return {
  'rmagatti/alternate-toggler',
  config = function()
    require('alternate-toggler').setup {
      alternates = {
        ['==='] = '!==',
        ['=='] = '!=',
        ['error'] = 'warn'
      }
    }

    local map = vim.keymap.set
    map("n", "<leader>i", "<CMD>ToggleAlternate<CR>", {})
  end
}
