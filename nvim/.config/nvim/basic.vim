" Use a new leader key
" let mapleader='\<Space>'
let mapleader=','

" Sane defaults
filetype plugin indent on
syntax enable                           " Enables syntax highlighing

" set hidden                              " Required to keep multiple buffers open multiple buffers
"
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file

set nowrap                              " Display long lines as just one line
set pumheight=10                        " Makes popup menu smaller
set cmdheight=2                         " More space for displaying messages

set ruler                               " Show the cursor position all the time
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line

set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

" set conceallevel=0                      " So that I can see `` in markdown files

set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2                       " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set shiftround
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set showtabline=2                       " Always show tabs
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal

" set laststatus=0                        " Always display the status line
" set laststatus=2

set wildmenu

set scrolloff=1
set sidescrolloff=5
set autoread
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" set noshowmode                          " We don't need to see things like -- INSERT -- anymore

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set noswapfile
set directory=/tmp
"set autochdir                           " Your working directory will always be the same as your working directory

set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
" set clipboard=unnamedplus               " Copy paste between vim and everything else
set clipboard^=unnamedplus

" set background=dark                     " tell vim what the background color looks like
" set t_Co=256                            " Support 256 colors
set termguicolors

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Keep selection when tabbing / de-tabbing
vnoremap < <gv
vnoremap > >gv

" C-u to uppercase word
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<ESC>

" Disable arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Enable Python & Node extensions
let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')
let g:node_host_prog = expand("~/.nvm/versions/node/v12.18.3/bin/node")

" Theme
colorscheme apprentice

" Airline
let g:airline_theme='minimalist'
" enable tabline
let g:airline#extensions#tabline#enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1

" Always show tabs
set showtabline=2

" Turn off search highlights
nnoremap <Leader>x :<C-u>nohlsearch<CR>

" FZF
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <Leader>f :Files<cr>
nmap <leader><tab> <plug>(fzf-maps-n)

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>
