set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'

call vundle#end()

"Enable filetype plugins"
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
highlight LineNr ctermfg=white ctermbg=NONE

"Set leader key
let mapleader = ","

"Tabs and windows easier to navigate
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <M-j> gt
noremap <M-k> gT
noremap ∆ gt
noremap ˚ gT
inoremap jj <Esc>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"Paste toggle
set pastetoggle=<F1>

"Ctrl-P
let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Finds/highlights searches while typing
set incsearch
set hlsearch
set ignorecase
set smartcase

"Syntastic"
let g:syntastic_aggregate_errors = 1

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

autocmd Filetype html,ruby,javascript,php setlocal shiftwidth=2 tabstop=2
autocmd Filetype python,c,cpp,java,perl setlocal shiftwidth=4 tabstop=4
autocmd FileType make set noexpandtab

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

"Makes Alt key available
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

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
