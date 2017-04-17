call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/findstr.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'

call plug#end()

imap jj <Esc>
imap {} {<CR>}<Esc>O
map <C-n> :NERDTreeToggle<CR>
map <C-w><C-d> :cd ~\Documents\Teamspace-Web\WebClient\<CR>
map <C-w><C-r> :Rfindstring
map <C-w><C-f> :Findstring

colorscheme solarized
set guifont=Consolas:h12
syntax on
set nu!
set rnu!
let @w='~\Documents\Teamspace-Web\WebClient\'
au GUIEnter * simalt ~x
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2

"ctrlp related settings"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1
