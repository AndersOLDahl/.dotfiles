set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'

Bundle 'python.vim'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'

call vundle#end()

"Enable filetype plugins"
filetype plugin indent on

"Enable syntax highlighting"
syntax enable
"Color scheme and settings"
set t_Co=256
set ruler
colorscheme codeschool
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermfg=white ctermbg=NONE

"Line numbers
set number

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
inoremap <C-v> <F10><C-r>+<F10>

noremap q <Nop>
let mapleader = "q"

nmap <leader>k $
nmap <leader>j ^
nmap <leader>h 0

"Syntastic"
let g:syntastic_aggregate_errors = 1

"Ctrl-P
let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"NERDTree"
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
set pastetoggle=<F10>

let g:NERDTreeDirArrows=0
let NERDTreeMapActivateNode='<space>'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


"Finds/highlights searches while typing
set incsearch
set hlsearch
set ignorecase
set smartcase

"4 spaces per indent, auto-indent default
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

autocmd Filetype html,ruby,javascript,python,php setlocal shiftwidth=2 tabstop=2
autocmd Filetype c,cpp,java,perl setlocal shiftwidth=4 tabstop=4
autocmd FileType make set noexpandtab

"80 characters per line
set textwidth=80

"Makes Alt key available
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000"

"Breaks on whitespace
set wrap linebreak nolist

"Can move away from a changed buffer without warning
set hidden

"Keeps the cursor off the bottom
set scrolloff=5

"Uncomment the following to have Vim jump to the last position when
"reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Delete trailing whitespace on save
autocmd FileType html,ruby,javascript,python,php,c,cpp,java,perl autocmd BufWritePre <buffer> :%s/\s\+$//e
