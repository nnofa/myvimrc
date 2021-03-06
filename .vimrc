﻿call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-vinegar'
Plug 'ajh17/VimCompletesMe'
Plug 'flazz/vim-colorschemes'

call plug#end()

"temporary mapping
inoremap jj <Esc>
inoremap jk <Esc>
inoremap ()h ()<Esc>i
inoremap ();h ();<Esc>hi
inoremap {}<CR> {<CR>}<Esc>O
inoremap {}h {}<Esc>i
inoremap {};h {}<Esc>hi
inoremap ()= () => {<CR>}<Esc>O
inoremap <C-Space> <C-x><C-o>
nnoremap <Leader>rf :Rfindstring<Space>
nnoremap <Leader>ff :Findstring<Space>

nnoremap <C-z><C-o> :set guifont=Consolas:h10<CR>
nnoremap <C-z><C-i> :set guifont=Consolas:h12<CR>
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
noremap / /\c

"save
" noremap <C-s> :w<CR>
" vnoremap <C-s> <C-c>:w<CR>
" inoremap <C-s> <C-c>:w<CR>

"sort
vnoremap <Leader>s :sort<CR>

"moving codeblocks in visual mode. like multi tab
vnoremap < <gv
vnoremap > >gv

"somehow lightline not working without this
set laststatus=2

"colorscheme and font
set background=dark
set guifont=Consolas:h11

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
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <F9> :%s/\s\+$//e<CR>
set clipboard=unnamed
" set list

"ctrlp related settings"
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" let g:ctrlp_by_filename=1
" let g:ctrlp_regexp=1
let g:ctrlp_working_path_mode=''

"ale setting
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=0

" let g:ale_linters = {
      " \ 'typescript': ['typecheck', 'tslint'],
      " \ 'javascript': ['eslint']
      " \}

let g:ale_linters = {
      \ 'typescript': ['typecheck'],
      \ 'javascript': ['eslint']
      \}

let g:ale_typescript_tslint_config_path = '~\tslint.json'
let g:ale_javascript_eslint_options = '~\.eslintrc'
let g:ale_javascript_eslint_use_global = 1

nnoremap <PageUp> :ALEPrevious<CR>
nnoremap <PageDown> :ALENext<CR>
nnoremap <Up> :cp<CR>
nnoremap <Down> :cn<CR>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lpr<CR>
autocmd filetype typescript :nnoremap <buffer> <C-@> :TsuquyomiReferences<CR>

"syntax highlighting
filetype off
filetype plugin indent on
syntax on

set pastetoggle=<F2>

let g:buffergator_autoexpand_on_split = 0
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
nnoremap <Leader>gp :Git push<CR>

let NERDSpaceDelims=1
if has("gui_running")
    set guioptions=icpM
    if has('win32') || has('win64')
        if (v:version == 704 && has("patch393")) || v:version > 704
            set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
                        \geom:1,renmode:5,taamode:1
        endif
    endif
    colorscheme PaperColor
else
    colorscheme zenburn
endif

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command= 'rg %s --files --color=never --glob ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" file is large from 1MB
let g:LargeFile = 1024 * 900
augroup LargeFile 
  au BufReadPre *
    \ let f=expand("<afile>") |
    \ if getfsize(f) > g:LargeFile |
            \ set eventignore+=FileType |
            \ setlocal noswapfile bufhidden=unload undolevels=-1 |
    \ else |
            \ set eventignore-=FileType |
    \ endif
augroup END
