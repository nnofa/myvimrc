call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/findstr.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/copypath.vim'
Plug 'tomasr/molokai'

call plug#end()

imap jj <Esc>
imap ()h ()<Esc>i
imap ();h ();<Esc>hi
imap {}o {<CR>}<Esc>O
imap {}O {<CR>}<Esc>O
imap {}<CR> {<CR>}<Esc>O
imap ()= ()<Space>=><Space>{<CR>}<Esc>O
imap <C-Space> <C-x><C-o>
nmap <C-n> :Vexplore<CR>
nmap <C-w><C-d> :cd $WebClient<CR>
nmap <C-w><C-r> :Rfindstring
nmap <C-w><C-f> :Findstring
nmap <C-z><C-o> :set guifont=Consolas:h10<CR>
nmap <C-z><C-i> :set guifont=Consolas:h12<CR>

colorscheme molokai 
set guifont=Consolas:h10
syntax on
set nu!
set rnu!
au GUIEnter * simalt ~x
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set nowrap
cd $WebClient 
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"ctrlp related settings"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1

