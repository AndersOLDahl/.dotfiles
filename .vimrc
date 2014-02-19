set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'https://github.com/kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'

Bundle 'python.vim'
Bundle 'tpope/vim-rails'

"Enable filetype plugins"
filetype plugin on
filetype indent on

"Enable syntax highlighting"
syntax enable

"Color scheme and settings"
set t_Co=256
colorscheme codeschool
highlight NonText ctermbg=black
highlight LineNr ctermfg=grey ctermbg=black

"Line numbers
set number 

"Tabs and windows easier to navigate
noremap <C-j> <C-w>w
noremap <C-k> <C-w>p
noremap <C-h> gt
noremap <C-l> gT
inoremap jj <Esc>

"Ctrl-P
let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"NERDTree"
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let NERDTreeMapActivateNode='<space>'

"Finds/highlights searches while typing
set incsearch
set hlsearch
set ignorecase
set smartcase

"4 spaces per indent, auto-indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

"80 characters per line
set textwidth=80
