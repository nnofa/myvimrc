﻿call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/findstr.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/copypath.vim'
Plug 'tomasr/molokai'
Plug 'pangloss/vim-javascript'
Plug 'KabbAmine/gulp-vim'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'

call plug#end()

cd $NG2Web

inoremap jj <Esc>
inoremap ()h ()<Esc>i
inoremap ();h ();<Esc>hi
inoremap {}<CR> {<CR>}<Esc>O
inoremap {}h {}<Esc>i
inoremap {};h {}<Esc>hi
inoremap ()= () => {<CR>}<Esc>O
inoremap <C-Space> <C-x><C-o>
nnoremap <C-w><C-d> :cd $NG2Web<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-w><C-r> :Rfindstring
nnoremap <C-w><C-f> :Findstring

nnoremap <C-z><C-o> :set guifont=Consolas:h10<CR>
nnoremap <C-z><C-i> :set guifont=Consolas:h12<CR>
nnoremap / /\c

"save
noremap <C-s> :w<CR>
vnoremap <C-s> <C-c>:w<CR>
inoremap <C-s> <C-o>:w<CR>

"sort
vnoremap <Leader>s :sort<CR>

"moving codeblocks in visual mode. like multi tab
vnoremap < <gv
vnoremap > >gv

"somehow lightline not working without this
set laststatus=2

let mapleader = ","

"colorscheme and font
colorscheme molokai
set guifont=Consolas:h10

"line numbering, relative for non-current line, absolute for current line
set nu!
set rnu!

au GUIEnter * simalt ~x
set backspace=2

"set tab to 2
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set nowrap
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
autocmd BufWritePre * %s/\s\+$//e
set list

set clipboard=unnamed

let NERDTreeShowHidden=1
"ctrlp related settings"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']

"syntax highlighting
filetype off
filetype plugin indent on
syntax on

set pastetoggle=<F2>

"lightline settings (the status bar below the stuff)
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ]]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "", 'right': "" },
      \ 'subseparator': { 'left': "|", 'right': "|" }
      \ }
