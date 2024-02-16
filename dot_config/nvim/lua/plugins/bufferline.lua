return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.bufremove",
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
  keys = {
    { "<A-Left>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Move to previous buffer" },
    { "<A-Right>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Move to next buffer" },
    { "<A-Tab>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Move to next buffer" },
    { "<A-,>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Re-order to previous buffer" },
    { "<A-.>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Move to previous buffer" },
    { "<A-p>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Move to previous buffer" },
  },
}
