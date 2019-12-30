"
" Roman Zelinskyi init.vim file
"

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'bfrg/vim-cpp-modern'
" All plugins need to be declared here
call plug#end()

source ~/.config/nvim/line.vim
source ~/.config/nvim/general.vim
