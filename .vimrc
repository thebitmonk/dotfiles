set ruler
set cursorline
set number
set t_Co=256
set laststatus=1

set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set noshowmode

if has('vim_starting')
	set nocompatible    
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	set runtimepath^=~/.vim/bundle/ctrlp.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" My Bundles here:
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'bling/vim-airline'
NeoBundle '907th/vim-auto-save'

" NERDTree, Use F2 for toggle NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>
" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=2 


" Ctrl P Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1 
let g:ctrlp_cache_dir = '$HOME/.vim/cache/ctrlp'
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|idea|cache|android)$','file': '\v\.DS_Store$'}


" Ulti Snips
" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Vim airline settings

let g:airline_theme='solarized'
"branch parts
let g:airline_enable_branch=1
"seperators
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"modes
let g:bufferline_echo = 0
let g:airline_section_y=""
"let g:airline_section_gutter=""
let g:airline_detect_whitespace=0
set ttimeoutlen=50


" Vim autosave settings
let g:auto_save = 1 

syntax enable

" Adding highlight for search
set hlsearch

" Indentation
set autoindent

" load indent file for the current filetype
filetype indent on

" word wrapping and inserted line breakes only when Enter key is hit
set wrap
set linebreak
set nolist  
" list disables linebreak
set textwidth=0
set wrapmargin=0


" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
