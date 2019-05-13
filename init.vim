""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim Configurations
" Author       : Raymond Wan
" Created      : 2011-11-11
" Updated      : 2019-05-13
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'matze/vim-move'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'lervag/vimtex', { 'for': 'tex' }

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/vim-emoji'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Shortcut for make
nnoremap <leader>m :make -j8<CR>
nnoremap <leader>n :!ninja -v<CR>

map <F2> :!./bin/goose<CR>

" Quick editing and saving of init.vim
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

set number " Turn on line numbering
set showcmd " Show command at the bottom
set mousehide " Hide the mouse when typing
set autoread " Auto read file when changed from outside

" More natural split behaviour
set splitbelow
set splitright

" Set the maximum number of changes to keep
set undolevels=10000

" Disable the beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Shortcut to insert dates (useful for vimwiki)
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" For listing errors
nnoremap <leader>go :copen<CR>
nnoremap <leader>gc :cclose<CR>
nnoremap <leader>gn :cnext<CR>
nnoremap <leader>gp :cprev<CR>

" Switching between source/header files
nnoremap <Leader>oc :e %<.c<CR>
nnoremap <Leader>oC :e %<.cpp<CR>
nnoremap <Leader>oh :e %<.h<CR>

" Search visual selection with //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Live substitution
set inccommand=nosplit

" Select last yanked
nnoremap <leader>V `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __AESTHETICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
set background=dark
colorscheme gruvbox


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __SPACES/TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set expandtab " Tabs are now spaces
set tabstop=2 " # of visual spaces per tab
set shiftwidth=2 " Number of spaces when performing shift+>>
set colorcolumn=80 " Show a column at 80 characters
set smarttab " insert tab according to shiftwidth not tabstop

" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <F6> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __SEARCHING
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
" __BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hides the buffer instead of closing them
set hidden

" Open a new empty buffer
nnoremap <leader>e :enew<CR>

" Go to the next buffer
nnoremap <leader>l :bnext<CR>

" Go to the previous buffer
nnoremap <leader>j :bprev<CR>

" List all the buffers
nnoremap <leader>bl :Buffer<CR>

" Delete the current buffer and move to the previous one
nnoremap <leader>bq :bprev <Bar> :bd! #<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __TERMINAL (nvim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')

  " Go to normal mode when in the terminal emulator
  tnoremap <Esc> <C-\><C-n>

  " Since we've remapped escape, we still need a way to send escape to the terminal
  tnoremap <C-v><Esc> <Esc>

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __LANGUAGE CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __PLUGIN CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete
""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1


" fzf
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>; :Buffers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>t :Tags<CR>

" Make fzf colors match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" vim-move
""""""""""""""""""""""""""""""""""""""""

let g:move_key_modifier='C'


" vim-better-whitepsace
""""""""""""""""""""""""""""""""""""""""

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0


" vim-fugitive
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>


" vim-airline
""""""""""""""""""""""""""""""""""""""""

set laststatus=2
set encoding=utf-8

let g:airline_theme='gruvbox'

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

let g:gitgutter_sign_modified='•'
let g:gitgutter_sign_added='❖'
highlight GitGutterAdd guifg = '#A3E28B'
"let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed = emoji#for('collision')


" NERDCommenter
""""""""""""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1


" NERDTree
""""""""""""""""""""""""""""""""""""""""

map <leader>\ :NERDTreeToggle<CR>


" vim-move
""""""""""""""""""""""""""""""""""""""""

let g:move_key_modifier = 'C'


" vimwiki
""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/index.wiki'},
                      \{'path_html': '~/Dropbox/vimwiki/html/'}]


" vim-go
""""""""""""""""""""""""""""""""""""""""

let g:go_auto_type_info = 1


" vim-highlightedyank
""""""""""""""""""""""""""""""""""""""""

" For older versions of vim
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 333 "ms
