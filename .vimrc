" Requires for 256 colors in OS X iTerm(2)
set t_Co=256

filetype off

" Pathogen for easy bundle inclusion
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on

" Enable syntax highlighting
syntax enable

set nocompatible
set modelines=0

" Tabbing settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set clipboard=unnamed
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set gdefault
set ttyfast
set ruler
set backspace=indent,eol,start

" Status bar
set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" Line numbers relative to current position
set relativenumber

" Disable swap files
set noswapfile

" Enable undo after closing files, but keep the files away from VCSs
set undofile
set undodir=~/.vim/undo

let mapleader = ","
let g:gist_clip_command = 'pbcopy'

" Settings for Solarized theme
set background=dark
let g:solarized_termcolors=256

" Default search with \v
nnoremap / /\v
vnoremap / /\v

" Search/Highlight tweaks
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Make leader space clear up highlighting
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" Wrap column settings
set wrap
set textwidth=82
set formatoptions=qrn1
set colorcolumn=85

" Enable mouse in CLI
set mouse=a

" Show list chars
set list

" List chars same as Textmate
set listchars=tab:▸\ ,eol:¬

" Make F2 toggle paste indenting with visual feedback
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Disable moving with arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk
nnoremap <leader>1 yypVr=

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>v :vs<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" $() shortcut
nnoremap <leader>4 caw$(<Esc>pa)<Esc>

" Color scheme
colorscheme solarized

" Markdown
augroup mkd
  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
