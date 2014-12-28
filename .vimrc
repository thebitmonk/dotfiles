syntax on
set clipboard=unnamed
set number
set tabstop=4 shiftwidth=4 expandtab

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'flazz/vim-colorschemes'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/tComment'
Bundle 'godlygeek/tabular' 
Bundle 'vim-scripts/a.vim'
Bundle 'szw/vim-tags'

call vundle#end()


filetype plugin indent on 
let mapleader=","

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set pastetoggle=<F2>


" NERDTree
nmap <leader>n :NERDTreeTabsToggle<CR>

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" NERD Tree Tabs Toggle 
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1

" Quit with :Q
command -nargs=0 Quit :qa!

" Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
" :helptags ~/.vim/bundle/ctrlp.vim/doc
set tags=./tags;

"Ctrl P and NerdTree magic
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" Git fugitive
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>


let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tab /=<CR>
  vmap <Leader>a= :Tab /=<CR>
  nmap <Leader>a: :Tab /:\zs<CR>
  vmap <Leader>a: :Tab /:\zs<CR>
endif

" Setting color scheme
colorscheme morning

