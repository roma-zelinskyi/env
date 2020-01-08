"
" Roman Zelinskyi general.vim file
"

" General configurations options
" All following configurations work for Vim and NeoVim

" Enable persistant undo and redo 
if has('persistent_undo')
    let undo_dir = '/tmp/vim_undo' " Create dirs
    call system('mkdir ' . undo_dir)
    let &undodir = undo_dir
    set undofile
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

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

" move around in insert mode 
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
