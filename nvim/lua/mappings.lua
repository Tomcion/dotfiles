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
map.n('<c-Up>', '<c-w>+') map.n('<c-Down>', '<c-w>-') map.n('<c-Right>', '2<c-w>>')
map.n('<c-Left>', '2<c-w><')

-- Keep blocks selected after tabbing
map.v('<', '<gv')
map.v('>', '>gv')

-- Center the cursor while searching
map.n('n', 'nzz')
map.n('N', 'Nzz')

-- Yank the rest of the line
map.n('Y', 'y$')

-- Get the word count of the current file
map.n('<leader>wc', ':!wc -w %<cr>')

-- Remove whitespace lines
map.n('<leader>ws', ":%s/^\\s\\+$//gc<cr>")

-- Toggle wrap and linebreak
LineBrOn = false

function ToggleLineBr()
    if LineBrOn then
        vim.opt.wrap = false
        vim.opt.linebreak = false
        vim.api.nvim_del_keymap('n', 'j')
        vim.api.nvim_del_keymap('n', 'k')
        LineBrOn = false
    else
        vim.opt.wrap = true
        vim.opt.linebreak = true
        map.n('j', 'gj')
        map.n('k', 'gk')
        LineBrOn = true
    end
end

map.n('<leader>wl', ':lua ToggleLineBr()<cr>')

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

