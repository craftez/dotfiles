return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    'kevinhwang91/promise-async',
  },
  config = function()
    require("ufo").setup {
      provider_selector = function()
        return { 'lsp', 'indent' }
      end,
    }

    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    local map = vim.keymap.set

    local ufo = require("ufo")
    map("n", "zR", ufo.openAllFolds)
    map("n", "zM", ufo.closeAllFolds)
    map("n", "zr", ufo.openFoldsExceptKinds)
    map("n", "zm", ufo.closeFoldsWith) -- closeAllFolds = closeAllFoldsWith(0)
    map("n", "zk", ufo.peekFoldedLinesUnderCursor)
  end
}
