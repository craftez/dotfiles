-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Do not auto comment new line",
  group = augroup("disable_auto_comment"),
  command = [[set formatoptions-=cro]],
})

-- Highlight on yank (override to have faster timeout which is default: 150)
-- https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/config/autocmds.lua#L13-L19
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("lazyvim_highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
})

-- start builtin terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start builtin terminal in insert mode",
  group = augroup("terminal_insert"),
  command = "startinsert",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Resize splits if window got resized",
  group = augroup("resize_splits"),
  command = "tabdo wincmd =",
})

-- automatically quit if quickfix window is the last
-- https://vim.fandom.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "automatically quit if quickfix window is the last",
  group = augroup("quit_on_last_quickfix"),
  callback = function()
    if vim.bo.buftype == "quickfix" and vim.fn.winbufnr(2) == -1 then
      vim.cmd("quit!")
    end
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Go to last loc when opening a buffer",
  group = augroup("last_loc"),
  callback = function(event)
    -- set cursor to the first line when editing a git commit message
    if vim.bo.filetype == "gitcommit" and vim.fn.fnamemodify(event.file, ":t") == "COMMIT_EDITMSG" then
      pcall(vim.api.nvim_win_set_cursor, 0, { 1, 0 })
    else
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end
  end,
})

-- auto detect filetype if unset
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Auto detect filetype if unset",
  group = augroup("auto_filetype_detection"),
  callback = function()
    if not vim.bo.filetype then
      vim.cmd("filetype detect")
    end
  end,
})

-- auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto create dir when saving a file",
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.file:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.file) or event.file
    local dir = vim.fn.fnamemodify(file, ":p:h")
    if not vim.loop.fs_stat(dir) then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- automatically give executable permission to new scripts starting with a shebang (#!)
vim.api.nvim_create_autocmd({ "BufWritePre", "BufWritePost" }, {
  desc = "Auto give executable permission to new scripts with shebang",
  group = augroup("auto_executable"),
  callback = function(event)
    if event.file:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.file) or event.file
    if event.event == "BufWritePre" then
      vim.b.is_new = not vim.loop.fs_stat(file)
    else -- event.event == "BufWritePost"
      if vim.b.is_new and vim.bo.filetype ~= "rust" then
        local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
        if first_line:match("^#!") and vim.fn.executable("chmod") == 1 then
          vim.fn.system({ "chmod", "a+x", file })
        end
      end
    end
  end,
})

-- automatically reload file
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = "Check if we need to reload the file when it changed",
  command = "checktime",
  group = augroup("checktime"),
})
