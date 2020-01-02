"
" Roman Zelinskyi plugged.vim file
"

" Configurations for plugins defined in init.vim file
" All following configurations work for Vim and NeoVim


""" neoclide/coc {
    let g:coc_global_extensions = [
        \ 'coc-snippets',
        \ 'coc-pairs',
        \]

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""" } neoclide/coc


""" { vim-airline/vim-airline
    set laststatus=2 " always show statusbar
    let g:bufferline_echo=0 " disable echo of current buffer in commandline
    let g:airline#extensions#tabline#enabled = 1 " automatically displays all buffers when there's only one tab open
    let g:airline#extensions#tabline#show_buffers = 0 " disable displaying buffers with a single tab
    let g:airline#extensions#tabline#show_tabs = 1 " enable displaying tabs, regardless of number
    let g:airline#extensions#tabline#fnamemod = ':p:t' " set filename mode
    let g:airline#extensions#tabline#fnametruncate = 0 " show full file names
    let g:airline#extensions#tabline#formatter = 'unique_tail' " set formatters
    let g:airline_powerline_fonts = 1 " enable powerline fonts
    let g:airline_theme='dark' " set airline theme

    let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/](googletest-download|googletest-src|googletest-build|CMakeFiles|bin|lib)$',
                \ 'file': '\v(exe|so|dll|o|marks|gcno|pyc|a|out|make|internal|includecache|Makefile|CMakeCache.txt|router_unit_test|murphy_unit_test|core_unit_test|pc|CMakeDoxyfile.in|router_integration_test|core_integration_test)$',
                \ }
""" }  vim-airline/vim-airline


""" { bfrg/vim-cpp-modern
    " Disable function highlighting (affects both C and C++ files)
    let g:cpp_no_function_highlight = 0
    " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
    " (affects both C and C++ files)
    let g:cpp_simple_highlight = 1
    " Enable highlighting of named requirements (C++20 library concepts)
    let g:cpp_named_requirements_highlight = 1
""" } bfrg/vim-cpp-modern


""" { lifepillar/vim-solarized8
    set background=dark
    colorscheme solarized8_flat
""" } lifepillar/vim-solarized8
