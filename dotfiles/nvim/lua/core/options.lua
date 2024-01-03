local set = vim.opt

-- Session Management
set.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Line Numbers
set.relativenumber = true
set.number = true

-- Tabs & Indentation
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.softtabstop = 2

-- Line Wrapping
set.wrap = false

-- Search Settings
set.ignorecase = true
set.smartcase = true

-- Cursor Line
set.cursorline = true

-- Appearance
set.termguicolors = true
set.background = 'dark'
set.signcolumn = 'yes'

-- Backspace
set.backspace = 'indent,eol,start'

-- Clipboard
set.clipboard:append("unnamedplus")

-- Split Windows
set.splitright = true
set.splitbelow = true

-- Consider - as part of keyboard
set.iskeyword:append("-")

-- Disable the mouse while in nvim
-- set.mouse = ""

-- Folding
set.foldlevel = 20
set.foldmethod = 'expr'
set.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds

