return {
  'vim-test/vim-test',
  config = function()
    local utils = require("utils")
    utils.keymap("n", "<leader>tf", ":TestFile<CR>")
  end
}
