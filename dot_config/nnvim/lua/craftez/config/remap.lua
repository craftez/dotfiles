local Keymaps = require("craftez.config.utils")
local nnoremap = Keymaps.nnoremap
local vnoremap = Keymaps.vnoremap
local xnoremap = Keymaps.xnoremap

nnoremap("<leader>pv", vim.cmd.Ex)

-- move selected range up and down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- preseve paste
xnoremap("<leader>p", "\"_dP")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

nnoremap("Q", "<nop>")

-- move to end and begin of line
nnoremap("H", "^")
nnoremap("L", "$")

-- open lazy.nvim UI
nnoremap("<leader>L", ":Lazy<CR>")

-- toggle undotree
nnoremap("<C-u>", ":UndotreeToggle<CR>")

-- close CURRENT buffer
nnoremap("<C-x>", ":bd<CR>")

--quickly switch between buffers
nnoremap("<", ":bp<CR>")
nnoremap(">", ":bn<CR>")

-- quickly switch between windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
-- nnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k")

-- write to all buffers
nnoremap(";w", ":wa<CR>")

-- quit all buffers
nnoremap(";q", ":qa<CR>")

-- force quit all buffers
nnoremap(";Q", ":qa!<CR>")

-- toggle transparency
-- nnoremap('<C-t>', ':TransparentToggle<CR>', opts)

-- open up Themery
-- nnoremap('<leader>t', ':Themery<CR>', opts)

-- replace CURRENT word
nnoremap("<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file an executable
nnoremap("<leader>x", "<CMD>!chmod +x %<CR>")

-- select entire file
nnoremap("<c-a>", "ggVG")

-- indent and outdent lines quickly
nnoremap('<TAB>', '>>')
nnoremap('<S-TAB>', '<<')

-- creates a new line below the cursor and goes back into normal mode
nnoremap('<CR>', 'o<Esc>')

-- creates a new line above the cursor and goes back into normal mode
nnoremap('<A-CR>', 'O<Esc>')

-- indent and outdent lines in visual mode
vnoremap('<TAB>', '<S->>gv')
vnoremap('<S-TAB>', '<S-<>gv')
