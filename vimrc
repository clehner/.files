set nocompatible

" Vundle setup
filetype off " required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My bundles
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

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

" show invisibles
set listchars=tab:‣\ ,trail:·

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

" navigate windows with ctrl+direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" colors!
syntax on
set background=dark
colorscheme solarized
