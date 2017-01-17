""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim Configurations
" Author       : Raymond Wan
" Created      : November 11th, 2011
" Last Changed : January 17th, 2017
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'jalvesaq/Nvim-R'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vim-emoji'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quick editing and saving of init.vim
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set number " Turn on line numbering
set showcmd " Show command at the bottom
set mousehide " Hide the mouse when typing
set autoread " Auto read file when changed from outside

" More natural split behaviour
set splitbelow
set splitright

" Set the maximum number of changes to keep
set undolevels=1000

" Disable the beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Go to normal mode when in the terminal emulator
tnoremap <Esc> <C-\><C-n>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AESTHETICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors

colorscheme seti

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACES/TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set expandtab " Tabs are now spaces
set tabstop=2 " # of visual spaces per tab
set shiftwidth=2 " Number of spaces when performing shift+>>
set colorcolumn=80 " Show a column at 80 characters
set smarttab " insert tab according to shiftwidth not tabstop



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch " Search as characters are typed
set hlsearch " Highlight search queries
set lazyredraw " Redraw only when required (for performance)
set ignorecase " Ignore case when searching
set smartcase " Ignores case unless the query has capitals
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Ignore version control

" Turn off search highlight
noremap <silent> <leader><space> :nohlsearch<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hides the buffer instead of closing them
set hidden

" Open a new empty buffer
nmap <leader>t :enew<CR>

" Go to the next buffer
nmap <leader>l :bnext<CR>

" Go to the previous buffer
nmap <leader>h :bprev<CR>

" List all the buffers
nmap <leader>bl :Buffer<CR>

" Delete the current buffer and move to the previous one
nmap <leader>bq :bprev <Bar> :bd #<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete
""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup=1

" fzf
""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :FZF<CR>


" vim-airline
""""""""""""""""""""""""""""""""""""""""

set laststatus=2
set encoding=utf-8

let g:airline_theme='dark'

" Change the seperators
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline_powerline_fonts=1

" Enable the tab bar
let g:airline#extensions#tabline#enabled=1

" Change the separators for the tab bar
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t' 

" Show the buffer number
let g:airline#extensions#tabline#buffer_nr_show=1

" Disable whitespace checks
let g:airline#extensions#whitespace#checks=[]


" vim-gitgutter
""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')
