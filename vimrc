set nocompatible

" Vundle setup
filetype off " required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My bundles
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'michaeljsmith/vim-indent-object'

filetype plugin indent on

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

" keep space around the cursor
set scrolloff=3

" invisible characters
set list
set listchars=tab:‣\ ,trail:· " show tabs and trailing spaces

" handling of long lines
set nowrap
set listchars+=precedes:←,extends:→
set sidescroll=1 " scroll horizontally in 1 character steps
set sidescrolloff=10 " keep some space on the side

" automatically reload files
set autoread

" keep swap files from cluttering directories
" // makes vim to use the full path for the filename
set directory=~/.vim/swap//

" default indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround " round indentation for > and < commands
set autoindent " retain indentation level

" behaviour of auto formatting
set formatoptions+=r " insert comment leader after <Enter> in insert mode
set formatoptions+=o " ... and 'o' or 'O' in normal mode
set formatoptions+=n " recognize (numbered) lists
set formatoptions+=l " dont wrap already long lines

" 80 column lines
set textwidth=80
set colorcolumn=+1

" split behaviour
set splitright " create new windows in reading direction
set splitbelow
set equalalways " resize windows when a new one is created
autocmd VimResized * exe "normal! \<c-w>="

" always display the status line
set laststatus=2

" relative line numbers
set relativenumber

" display position in file
set ruler

" show partial commands
set showcmd

" navigate windows with ctrl+direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" colors!
syntax on
set background=dark
colorscheme solarized
