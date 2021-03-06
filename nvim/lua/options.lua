vim.cmd "syntax on"

vim.cmd "filetype plugin indent on"

local set = vim.opt

set.errorbells = false
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.completeopt = { 'menu', 'menuone', 'noselect' }
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

vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    callback = function(args)
        set.cursorline = false
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    callback = function(args)
        set.cursorline = true
    end,
})
