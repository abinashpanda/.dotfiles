"
" This vimrc is created using [Lear Vimscript the Hard
" Way](learningvimscriptthehardway.stevelosh.com).
"
" Written(W) 2014 Abinash Panda

set encoding=utf-8
set laststatus=2

" Modify the behaviour of backspace
set backspace=2

" Runtime path manipulation for Pathogen
execute pathogen#infect()

" Airline Setup
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and backspace
set mouse=a

" Rebind <Leader> key
let mapleader = ","

" Easier editing of vimrc file
noremap <Leader>ev :vsp $MYVIMRC<cr>
noremap <Leader>sv :source $MYVIMRC<cr>

" Bind nohl
" Removes highlight of your last search
noremap <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>
inoremap <Leader>n :nohl<CR>

" Easier moving between tabs
" set similar to tmux configurations
noremap <C-P> <esc>:tabprevious<CR>
noremap <C-N> <esc>:tabnext<CR>
noremap <C-C> <esc>:tabnew<CR>
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Easier sorting
vnoremap <Leader>s :sort<CR>

" Easier formatting
vnoremap < <gv
vnoremap > >gv

" Show whitespace
""autocmd Colorscheme * highlight ExtraWhitespace ctermbg=red guigb=red
""au InsertLeave * match ExtraWhitespace /\s+$/

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=black guibg=orange

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Set spaces instead of TABS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
" set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Set wildmenu
set wildmenu

" Easier selection and deletion
nnoremap <space> viw

" Easier moving of lines 
" ----------------------
" Moves the line downwards
nnoremap - ddp
" Moves the line upwards
nnoremap _ ddP

" Changing words to upper case and vice-versa
inoremap <c-u> <esc>viwUA
inoremap <c-l> <esc>viwuA

" Creating handy abbreviations
iabbrev @@ abinash.panda.ece10@itbhu.ac.in
iabbrev ccopy Copyright(C) 2014 Abinash Panda
iabbrev wwrit Written(W) 2014 Abinash Panda
iabbrev ssig --<cr>Abinash Panda<cr>abinash.panda.ece10@itbhu.ac.in

" Easier insertion of quotes
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel

" Astyle autoformatting C++ files
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ --style=allman\ --lineend=linux\ --indent=tab=8\ --break-blocks\ --unpad-paren\ --pad-header\ --pad-oper\ --close-templates\ --add-brackets\ --align-pointer=middle\ --align-reference=name

