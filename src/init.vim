"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2021 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

set mouse=
let g:coc_disable_transparent_cursor = 1

let g:NERDTreeWinSize=40

:imap qq <Esc>

set autochdir

autocmd FileType qf wincmd J

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>. :Lines<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

let g:fzf_tags_command = 'ctags -R'

let g:fzf_colors =
\{ 'fg':      ['fg', 'Normal'],
 \'bg':      ['bg', 'Normal'],
 \'hl':      ['fg', 'Comment'],
 \'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 \'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
 \'hl+':     ['fg', 'Statement'],
 \'info':    ['fg', 'PreProc'],
 \'border':  ['fg', 'Ignore'],
 \'prompt':  ['fg', 'Conditional'],
 \'pointer': ['fg', 'Exception'],
 \'marker':  ['fg', 'Keyword'],
 \'spinner': ['fg', 'Label'],
 \'header':  ['fg', 'Comment'] }

let g:coc_snippet_next = ''
let g:coc_snippet_prev = ''
inoremap <expr> <c-j>
   \ pumvisible() ? "\<c-n>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
   \ "\<c-j>"
inoremap <expr> <c-k>
   \ pumvisible() ? "\<c-p>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" :
   \ "\<c-k>"

" GoTo code navigation.
nmap <silent> <C-]> <Plug>(coc-definition)
nnoremap <silent> <C-[> <C-o>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> R <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
