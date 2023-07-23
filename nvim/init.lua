local set = vim.o
local opts = { silent = true, noremap = true }

-- Leader key
vim.g.mapleader = ','

-- Theme
vim.g.colors_name = 'dracula'

-- Line indicators
set.number = true
set.relativenumber = true
set.cursorline = true

-- Tab settings
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

---- removes cursorline (keep only line number highlight)
--vim.cmd([[ hi CursorLine gui=NONE ]])

-- Keep undo files on RAM
set.undofile = true
set.undodir = vim.fn.expand "/tmp/nvim/undofiles"

-- Remove backup and swap files
set.backup = false
set.swapfile = false

require('plugins')
