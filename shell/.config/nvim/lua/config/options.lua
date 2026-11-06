-- Editor options

local o = vim.o

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- UI
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.termguicolors = true
o.showmode = false
o.laststatus = 3
o.pumheight = 12
o.pumborder = 'rounded'
o.pummaxwidth = 50
o.scrolloff = 8
o.sidescrolloff = 8
o.splitright = true
o.splitbelow = true

-- Editing
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.wrap = false
o.linebreak = true
o.breakindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.inccommand = 'split'

-- Files
o.undofile = true
o.swapfile = false
o.backup = false
o.updatetime = 250
o.timeoutlen = 300

-- Completion (native 0.12)
o.completeopt = 'menu,menuone,noselect,fuzzy'

-- Folds (treesitter-based)
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldlevel = 99
o.foldlevelstart = 99

-- Clipboard
o.clipboard = 'unnamedplus'
