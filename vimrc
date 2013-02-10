set nocompatible

filetype plugin indent on

runtime bundle/vim-pathogen/autoload/pathogen.vim

" enable modeline for all setups
" vim shipped with OSX has it disabled by default
set modeline modelines=5

" show all possible completions
set wildmenu
set wildmode=list:longest

" search options
set ignorecase " ignore case...
set smartcase " unless it contains uppercase letters
set hlsearch " highlight matches
set incsearch " incremental search

" handling of long lines
"set nowrap
set wrap
set sidescroll=1 " scroll horizontally in 1 character steps
set sidescrolloff=10 " keep some space on the side

" automatically reload files
set autoread

" keep swap files from cluttering directories
" // makes vim to use the full path for the filename
"set directory=~/.vim/swap/

" default indentation
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround " round indentation for > and < commands
set autoindent " retain indentation level
set smartindent

" behaviour of auto formatting
set formatoptions+=r " insert comment leader after <Enter> in insert mode
set formatoptions+=o " ... and 'o' or 'O' in normal mode
set formatoptions+=n " recognize (numbered) lists
set formatoptions+=l " dont wrap already long lines

" 80 column lines
set textwidth=80
if exists("&colorcolumn")
  set colorcolumn=+1
endif

" split behaviour
set splitright " create new windows in reading direction
set splitbelow
set equalalways " resize windows when a new one is created
autocmd VimResized * exe "normal! \<c-w>="

" always display the status line
set laststatus=2

" relative line numbers
"if exists("&relativenumber")
  "set relativenumber
"else
  "set number
"endif

" display position in file
set ruler

" show partial commands
set showcmd

" navigate windows with ctrl+direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use the arrows to do something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Set leader to ,
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Ctrl-L is remapped, so use leader-L
nnoremap <leader>l :redraw!<cr>

" netbeans
noremap <c-s> :nbs<cr>

" Allow unsaved hidden buffers
set hidden

" colors!
syntax on
"set background=dark
"colorscheme solarized

" Use Q for formattting, not ex
map Q gq

" Start Pathogen
call pathogen#infect()

" Liberal line endings
set ffs=unix,mac,dos

" Easy executifying
noremap <leader>x :!chmod +x %<cr><cr>

" Open vimrc
noremap <leader>; :tabe ~/.vimrc<cr>
" Save and reload vimrc
noremap <leader>. :w<cr>:so ~/.vimrc<cr>

let g:syntastic_java_javac_autoload_maven_classpath = 0
let g:syntastic_java_javac_config_file_enabled = 1

" Shortcuts for jumping through errors (location list)
map [l :lprev<cr>
map ]l :lnext<cr>

":setlocal makeprg=javac\ %
" Easy make
noremap <leader>m :make<cr><cr>

" Paste from X Clipboard (hack)
noremap <leader>v :.!xsel<cr>

