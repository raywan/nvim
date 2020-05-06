""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @Author       : Raymond Wan
" @Created      : 2011-11-11
" @Updated      : 2020-05-06
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('C:\Users\Ray\AppData\Local\nvim\plugged')
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim' " For running build.bat and other build files
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
call plug#end()

let mapleader="\<space>"

" Quick editing and saving of init.vim
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

colorscheme gruvbox

set mouse=a
set number
set showcmd
set autoread
set wrap

" Disable the beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" More natural split behaviour
set splitbelow
set splitright

" Set the maximum number of changes to keep
set undolevels=10000

" Live substitution
set inccommand=nosplit

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set incsearch " Search as characters are typed
set hlsearch " Highlight search queries
set ignorecase " Ignore case when searching
set smartcase " Ignores case unless the query has capitals
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Ignore version control

" Fuzzy find
set path+=**
set wildmenu

set makeprg=build.bat

" Select last yanked
nnoremap <leader>V `[v`]

" Turn off search highlight
noremap <silent> <leader><space> :nohlsearch<CR>
noremap <leader>b :ls<CR>:b<space>
" noremap <leader>bs :ls<CR>:sb<space>
" noremap <leader>bv :ls<CR>:vert sb<space>
noremap <leader>j :bprev<CR>
noremap <leader>l :bnext<CR>
noremap <leader>q :bdelete<CR>
noremap <leader>E :E<CR>
noremap <leader>c :close<CR>
noremap <leader>f :find<space>
noremap <leader>h :sp<CR>
noremap <leader>v :vs<CR>
noremap <leader>, :call QuickFixToggle()<CR>
" noremap <leader>, :copen<CR>
noremap <leader>. :cclose<CR>
noremap <leader>n :cnext<CR>
noremap <leader>p :cprev<CR>
noremap <leader>m :AsyncRun -program=make<CR>
" Can also set the current working directory like this
" :AsyncRun -program=make -cwd=demo

" Switching between source/header files
nnoremap <Leader>oc :e %<.c<CR>
nnoremap <Leader>oC :e %<.cpp<CR>
nnoremap <Leader>oh :e %<.h<CR>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" NOTE(ray): This has an issue where if I close quickfix via :q then I'll need
" to call this twice to fix the state
let g:rw_quickfix_is_open = 0
function! QuickFixToggle()
    if g:rw_quickfix_is_open
        cclose
        let g:rw_quickfix_is_open = 0
    else
        copen
        let g:rw_quickfix_is_open = 1
    endif
endfunction
