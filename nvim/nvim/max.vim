call plug#begin()

" Basic setup
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Powerups
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi'
Plug 'liuchengxu/vim-which-key'
Plug 'lervag/vimtex'

" Git tools
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-gist'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rudrab/vimf90'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'

" Testing tools
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

" Debugger
" Plug 'puremourning/vimspector'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'

call plug#end()
" Use a new leader key
" let mapleader='\<Space>'
let mapleader=','

" Cursor setup
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon2,a:blinkoff1

" Allows project-specific .vimlocal files
silent! so .vimlocal

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
let g:python3_host_prog = expand('~/.pyenv/versions/pynvim/bin/python')
let g:node_host_prog = expand("~/.nvm/versions/node/v14.16.0/bin/node")

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
" vim-javascript settings
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_arrow_function = "⇒"
set conceallevel=1

" vim-test
let test#strategy = "neovim"
let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tg :TestVisit<CR>
nmap <silent> <Leader>un <Plug>(ultest-run-nearest)
nmap <silent> <Leader>uf <Plug>(ultest-run-file)
nmap <silent> <Leader>us <Plug>(ultest-summary-jump)
nmap <silent> <Leader>ut <Plug>(ultest-summary-toggle)
" lsp
lua << EOF
local lspconfig = require'lspconfig'

--[[
  JavaScript & TypeScript
    npm: 
      * local dev dependency *
      npm install -D typescript-language-server
      * or global install *
      npm install -g typescript-language-server
  https://github.com/theia-ide/typescript-language-server
--]]
lspconfig.tsserver.setup{
  cmd = { "npx", "typescript-language-server", "--stdio" }
}

--[[
  Fortran
    pip: pip install fortran-language-server
  https://github.com/hansec/fortran-language-server
--]]
lspconfig.fortls.setup{}

--[[
  Julia
    using Pkg
    Pkg.add("LanguageServer")
  https://github.com/julia-vscode/LanguageServer.jl
--]]
lspconfig.julials.setup{}

--[[
  Python
    pip: pip install 'python-lsp-server[all]'
    conda: conda install -c conda-forge python-lsp-server
  https://github.com/python-lsp/python-lsp-server
--]]
lspconfig.pylsp.setup{}

--[[
  Terraform
    # Add the HashiCorp GPG key
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    # Add the official HashiCorp Linux repository
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install terraform-ls
  https://github.com/hashicorp/terraform-ls
--]]
lspconfig.terraformls.setup{}

EOF

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting()
" completions
lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
