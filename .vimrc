syntax on
set clipboard=unnamed
set number
set tabstop=4 shiftwidth=4 expandtab


set backspace=indent,eol,start
let mapleader=","

let &t_Co=256

set nocompatible

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'flazz/vim-colorschemes'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'matze/vim-move'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'derekwyatt/vim-scala'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'shime/vim-livedown'
Plugin 'rizzatti/dash.vim'

call vundle#end()  

filetype plugin on
" Setting color scheme
colorscheme molokai 

let g:go_disable_autoinstall = 0  

filetype plugin indent on 
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


let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" NERDTree
nmap <leader>n :NERDTreeTabsToggle<CR>
" NERD Tree Tabs Toggle 

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Quit with :Q
command -nargs=0 Quit :qa!

" Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
" :helptags ~/.vim/bundle/ctrlp.vim/doc
set tags=./tags;


"Ctrl P and NerdTree magic
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

map  <S-l> :tabn<CR>
map  <S-h> :tabp<CR>


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

let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Tag bar toggle
nmap <F8> :TagbarToggle<CR>

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = "/usr/bin/python"

au BufWritePost *.c,*.cpp,*.h,*.go silent! !ctags -R &
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile *.scala set filetype=scala
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Mapping Ack key
nnoremap <leader>a :Ack

" Increase decrease size of screen
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap + <c-w>+
nnoremap - <c-w>-
nnoremap < <c-w><
nnoremap > <c-w>>
nnoremap <Bar> <c-w><Bar>
nnoremap _ <c-w>_
nnoremap <F5> :call WindowToggle()<cr>
nnoremap <F2> :call RestoreWindows()<cr>



let g:window_is_maximized = 0
function! WindowToggle()
    if g:window_is_maximized
        let g:window_is_maximized= 0
        :call RestoreWindows()
        :exe "normal \<c-w>\="
    else
        let g:window_is_maximized = 1
        :exe "normal \<c-w>\_\<c-w>\<Bar>"
    endif
endfunction

function! RestoreWindows()
  let g:window_is_maximized= 0
  :exe ":NERDTreeToggle"
  :exe ":vertical resize 31"
endfunction

" Move lines up and down. Effective to move blocks of text in visual mode
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Move a window to a tab in nerd tree
nnoremap <C-n> :tab split<CR> 

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi


" Ctrl P ignore files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let g:airline_theme= 'zenburn'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'


let g:livedown_autorun = 1

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337
