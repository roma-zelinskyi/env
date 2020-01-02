"
" Roman Zelinskyi format.vim file
"

" description:  Configuration calls clang-format to format source file on write cmd
"
" requirements: clang-format-8 or higher
"

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format-8/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call Formatonsave()
