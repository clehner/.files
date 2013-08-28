set nocompatible

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

" indentation by format
filetype plugin indent on

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
nmap <Right> :bn<cr>
nmap <Left> :bp<cr>
nmap <Up> 10<c-y>
nmap <Down> 10<c-e>

" Use plus/minus for numbers
nmap + <c-a>
nmap - <c-x>

" Set leader to ,
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast close buffer
nmap <leader>d :bd<cr>

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
silent! call pathogen#infect()

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
let g:syntastic_always_populate_loc_list=1

" Shortcuts for jumping through errors (location list)
map [l :lprev<cr>
map ]l :lnext<cr>

" Shortcuts for jumping through error list
map [e :cprev<cr>
map ]e :cnext<cr>

":setlocal makeprg=javac\ %
" Easy make
noremap <leader>m :make<cr><cr>

" Paste from X Clipboard (hack)
noremap <leader>v :.!xsel<cr>

" Closetag
au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim

" remove man lookup
vnoremap K gk
nnoremap K gk

" Make the wildcard menu work like bash
set wildmenu
set wildmode=longest,list

" make wildcard menu ignore binary files
set wildignore+=*.a,*.o,*.bmp,*.gif,*.ico,*.jpg,*.png,*~,*.swp,*.tmp,*.class

" Status
set laststatus=2
set statusline=%f%m%r\ %l:%c

" Toggle line numbers
nmap <leader>n :setlocal number!<cr>

" Enter paste mode
nmap <leader>o :set paste!<cr>

" Toggle search highlighting and jumping
nmap <leader>q :set hlsearch!<cr>:set incsearch!<cr>

" Press escape to clear highlights
nnoremap <esc> :noh<return><esc>

":nmap ; :CtrlPBuffer<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
":let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" NERDTree
:nmap <leader>e :NERDTreeToggle<CR>

" Color terminal
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Tab stops
" http://statico.github.com/vim.html
nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>
nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<cr>
nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<cr>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>

" Toggle line wrap
nmap <leader>r :setlocal wrap!<cr>:setlocal wrap?<cr>

" Disable automatic folding
"set nofoldenable
"set foldmethod=indent
"set foldlevel=20
"set foldlevelstart=20

nmap <leader>c :CoffeeCompile<cr>

function! CloseHiddenBuffers()
	" Tableau pour memoriser la visibilite des buffers
	let visible = {}
	" Pour chaque onglet...
	for t in range(1, tabpagenr('$'))
		" Et pour chacune de ses fenetres...
		for b in tabpagebuflist(t)
			" On indique que le buffer est visible.
			let visible[b] = 1
		endfor
	endfor
	" Pour chaque numero de buffer possible...
	for b in range(1, bufnr('$'))
		" Si b est un numero de buffer valide et qu'il n'est pas visible, on le
		" supprime.
		if bufexists(b) && !has_key(visible, b)
			" On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
			" sont pourtant charges en memoire.
			execute 'bwipeout' b
		endif
	endfor
endfun

command! Bdi :call CloseHiddenBuffers()
