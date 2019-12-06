"
" Roman Zelinskyi general.vim file
"

" General configurations options
" All following configurations work for Vim and NeoVim

set hidden

" disable keeping backup files after successful write.
set nobackup
set nowritebackup

set cmdheight=2 " set height for command window to 2 for better visibility 
set signcolumn=yes " always show signcolumns

" It will be bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set autoread        " auto file chage detection 
set textwidth=100
set noswapfile      " disable swap files

" case insensitive search
set ignorecase
set smartcase

set hlsearch    " highlight searches
set incsearch   " search while typing
set wrapscan    " wrap-around when searching
