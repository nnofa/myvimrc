call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/findstr.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/copypath.vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'KabbAmine/gulp-vim'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'

call plug#end()

cd $tw

"temporary mapping
nnoremap <Home> iteamspace.<Esc>
nnoremap <End> iteamspace.components.<Esc>
nnoremap <Insert> iteamspace.services.<Esc>
inoremap jj <Esc>
inoremap jk <Esc>
inoremap ()h ()<Esc>i
inoremap ();h ();<Esc>hi
inoremap {}<CR> {<CR>}<Esc>O
inoremap {}h {}<Esc>i
inoremap {};h {}<Esc>hi
inoremap ()= () => {<CR>}<Esc>O
inoremap <C-Space> <C-x><C-o>
nnoremap <C-w><C-d>1 :cd $WebClient<CR>
nnoremap <C-w><C-d>2 :cd $WebClient<CR> :cd ../modules<CR>
nnoremap <Leader>rf :Rfindstring<Space>
nnoremap <Leader>ff :Findstring<Space>

nnoremap H gT
nnoremap L gt
nnoremap <C-z><C-o> :set guifont=Consolas:h10<CR>
nnoremap <C-z><C-i> :set guifont=Consolas:h12<CR>
nnoremap / /\c

"save
noremap <C-s> :w<CR>
vnoremap <C-s> <C-c>:w<CR>
inoremap <C-s> <C-c>:w<CR>

"sort
vnoremap <Leader>s :sort<CR>

"moving codeblocks in visual mode. like multi tab
vnoremap < <gv
vnoremap > >gv

"somehow lightline not working without this
set laststatus=2

"colorscheme and font
colorscheme solarized
set background=light
set guifont=Consolas:h10

nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

"line numbering, relative for non-current line, absolute for current line
set nu
set rnu

au GUIEnter * simalt ~x
set backspace=2

"set tab to 2
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set nowrap
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <F9> :%s/\s\+$//e<CR>
" set list

set clipboard=unnamed

"ctrlp related settings"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1
let g:ctrlp_working_path_mode=''

"ale setting
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=0

let g:ale_linters = {
      \ 'typescript': ['typecheck', 'tslint']
      \}

let g:ale_typescript_tslint_config_path = '~\tslint.json'
nnoremap <PageUp> :ALEPrevious<CR>
nnoremap <PageDown> :ALENext<CR>
nnoremap <Up> :cp<CR>
nnoremap <Down> :cn<CR>
autocmd filetype typescript :nnoremap <buffer> <C-@> :TsuquyomiReferences<CR>

"syntax highlighting
filetype off
filetype plugin indent on
syntax on

set pastetoggle=<F2>

let g:buffergator_autoexpand_on_split = 0
"lightline settings (the status bar below the stuff)
let g:lightline = {
      \ 'colorscheme': 'wombat',
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

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"fugitive settings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gg :Ggrep<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gcm :Gcommit<CR>
nnoremap <Leader>gch :Git checkout 
