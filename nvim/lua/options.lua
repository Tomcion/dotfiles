vim.cmd "syntax on"

vim.cmd "filetype plugin indent on"

local set = vim.opt

set.errorbells = false
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.completeopt = { 'menuone', 'noselect' }
set.number = true
set.relativenumber = true
set.wrap = false
set.smartcase = true
set.swapfile = false
set.backup = false
set.undofile = false
set.incsearch = true
set.hlsearch = false
set.scrolloff = 4
set.pumheight = 10
set.cursorline = true
set.splitright = false
set.signcolumn = 'no'

vim.cmd [[
    augroup cursor
        autocmd!
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    augroup END
]]
