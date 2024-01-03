return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,                   -- enable treesitter
    ts_config = {
      lua = { "string" },              -- don't add pairs in lua string treesitter modes
      javascript = { "template_string" }, -- don't add pairs in javavscript template_string
    },
  },
}
