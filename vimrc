"Vundle and plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

"Enable syntax highlighting"
syntax enable

"Color scheme and settings"
set t_Co=256
colorscheme codeschool
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set ruler

"Line numbers
set relativenumber
set number
highlight LineNr ctermfg=white ctermbg=NONE

"Tabs and windows easier to navigate
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <a-j> gt
noremap <a-k> gT
noremap ∆ gt
noremap ˚ gT
inoremap jj <Esc>

noremap \y "*y
noremap \yy "*yy
noremap \Y "*Y
noremap \p "*p
noremap \P "*P

"Finds/highlights searches while typing
set incsearch
set hlsearch
set ignorecase
set smartcase

"FZF
nnoremap <silent> <C-p> :FZF<CR>

"Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"4 spaces per indent, auto-indent default
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

"80 characters per line
set textwidth=80

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000"

"Can move away from a changed buffer without warning
set hidden

"Keeps the cursor off the bottom
set scrolloff=5

" Esc timeout to work with tmux
set timeout ttimeoutlen=50

"Jump to last position when opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"Breaks on whitespace
set wrap linebreak nolist

"Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Delete trailing whitespace on save
autocmd FileType html,ruby,javascript,python,php,c,cpp,java,perl autocmd BufWritePre <buffer> :%s/\s\+$//e
