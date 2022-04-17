local map = require('utils.key_mappings')

vim.g.mapleader = ' '

-- Exiting insert mode
map.i('jk', '<Esc>')

-- Window navigation
map.n('<c-j>', '<c-w>j')
map.n('<c-k>', '<c-w>k')
map.n('<c-l>', '<c-w>l')
map.n('<c-h>', '<c-w>h')

-- Window resizing
map.n('<c-Up>', '<c-w>+')
map.n('<c-Down>', '<c-w>-')
map.n('<c-Right>', '2<c-w>>')
map.n('<c-Left>', '2<c-w><')

-- Editing and sourcing vimrcs
map.n('<leader>vc', ':vsplit $MYVIMRC<cr>')
map.n('<leader>sv', ':source $MYVIMRC<cr>')

-- Keep blocks selected after tabbing
map.v('<', '<gv')
map.v('>', '>gv')

-- Center the cursor while searching
map.n('n', 'nzz')
map.n('N', 'Nzz')

-- Yank the rest of the line
map.n('Y', 'y$')

-- Embed a word with brackets or quotation marks
map.n('<leader>"', 'viw<esc>a"<esc>bi"<esc>el')
map.n("<leader>'", "viw<esc>a'<esc>bi'<esc>el")
map.n('<leader><', 'viw<esc>a><esc>bi<<esc>el')
map.n('<leader>{', 'viw<esc>a}<esc>bi{<esc>el')
map.n('<leader>[', 'viw<esc>a]<esc>bi[<esc>el')
map.n('<leader>(', 'viw<esc>a)<esc>bi(<esc>el')

-- Comment out the current line
vim.cmd[[
    augroup commenting_out
        autocmd!
        autocmd BufNewFile,BufRead * nnoremap <leader>c mc0i// <esc>`clll
        autocmd BufNewFile,BufRead *.vim nnoremap <leader>c mc0i" <esc>`cll 
        autocmd BufNewFile,BufRead *.py nnoremap <leader>c mc0i# <esc>`cll 
        autocmd BufNewFile,BufRead *.lua nnoremap <leader>c mc0i-- <esc>`cll 
    augroup END
]]

-- Terminal
map.n('<leader>tr', ':belowright new<cr>:terminal<cr>')
map.n('<leader>T', ':tabedit new<cr>:terminal<cr>')
map.t('jk', '<c-\\><c-n>')

