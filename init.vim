""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @Author       : Raymond Wan
" @Created      : 2011-11-11
" @Updated      : 2022-06-08
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:plug_path = "C:\\Users\\Ray\\AppData\\Local\\nvim\\plugged"
    else
        let g:plug_path = "~/.config/nvim/plugged"
    endif
endif

call plug#begin(plug_path)
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim' " For running build.bat and other build files
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'beyondmarc/hlsl.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'EdenEast/nightfox.nvim'
call plug#end()

syntax enable
filetype plugin indent on

" colorscheme gruvbox
" colorscheme srcery
colorscheme nightfox

let mapleader="\<space>"

" Quick editing and saving of init.vim
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

set mouse=a
set number
set showcmd
set autoread
set cursorline
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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.exe,*.png,*.jpg,*.jpeg,*.bmp,*.pdb,*.sln,*.dll,*.lib,*/prototypes/*,*/deps/*

" Fuzzy find
set path+=**
set wildmenu

" set makeprg=build_win32.bat
" set makeprg=ninja\ -f\ synthesis_engine_sdl_win32_opengl33.ninja\ -v
set makeprg=build.bat

" Select last yanked
nnoremap <leader>V `[v`]

" Turn off search highlight
noremap <silent> <leader><space> :nohlsearch<CR>
"noremap <leader>l :ls<CR>:b<space>
noremap <leader>l :Buffers<CR>
" noremap <leader>bs :ls<CR>:sb<space>
" noremap <leader>bv :ls<CR>:vert sb<space>
noremap <leader>[ :bprev<CR>
noremap <leader>] :bnext<CR>
noremap <leader>q :bdelete<CR>
noremap <leader>E :E<CR>
noremap <leader>c :close<CR>
" noremap <leader>f :find<space>
noremap <leader>f :Files<CR>
noremap <leader>h :sp<CR>
noremap <leader>v :vs<CR>
noremap <leader>, :call QuickFixToggle()<CR>
noremap <leader>. :cclose<CR>
noremap <leader>n :cnext<CR>
noremap <leader>p :cprev<CR>
noremap <leader>m :AsyncRun -program=make<CR>
noremap <F5> :AsyncRun -program=make<CR>
noremap <F9> :AsyncRun! ninja -f rw_engine_win32_d3d12.ninja -v<CR>
noremap <F10> :AsyncRun! ninja -f rw_engine_sdl_win32_d3d12.ninja -v<CR>
noremap <F11> :AsyncRun! ninja -f rw_engine_win32_opengl33.ninja -v<CR>
noremap <F12> :AsyncRun! ninja -f rw_engine_win32_vulkan.ninja -v<CR>
" Can also set the current working directory like this
" :AsyncRun -program=make -cwd=demo

" Switching between source/header files
nnoremap <leader>oc :e %<.c<CR>
nnoremap <leader>oC :e %<.cpp<CR>
nnoremap <leader>oh :e %<.h<CR>

" Switch the the alternate buffer
nnoremap <leader><tab> <C-^>

" Delete all buffers except the current one (not working right now)
map <leader><BS> :%bd\|e#<CR>

" Make it so that ctrl+c and ctrl+v work, which is convenient
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <leader>/ :vimgrep<space>

" Default leader-g to be vimgrep and override it if ripgrep is available
nnoremap <leader>g :vimgrep<space>
if executable("rg")
    nnoremap <leader>g :grep<space>
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    " set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

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

let g:rw_location_list_is_open = 0
function! LocationListToggle()
    if g:rw_location_list_is_open
        cclose
        let g:rw_location_list_is_open = 0
    else
        copen
        let g:rw_location_list_is_open = 1
    endif
endfunction

augroup bgfx_sc_ft
  au!
  autocmd BufNewFile,BufRead *.sc set syntax=glsl
  autocmd BufNewFile,BufRead *.sc set tabstop=4
  autocmd BufNewFile,BufRead *.sc set shiftwidth=4
augroup END
