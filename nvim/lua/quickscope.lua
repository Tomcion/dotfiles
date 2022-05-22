vim.cmd[[
    augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guibg='#afff5f' ctermbg=155 guifg='#303030' ctermfg=236
        autocmd ColorScheme * highlight QuickScopeSecondary guibg='#5fffff' ctermbg=81 guifg='#303030' ctermfg=236
    augroup END
]]

vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

