if exists('g:vscode')
  " VSCode-embedded configuration
 
else
  " Standalone Neovim configuration

  call plug#begin()

  " Basic setup
  Plug 'tpope/vim-sensible'
  Plug 'romainl/Apprentice'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Powerups
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-commentary'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mg979/vim-visual-multi'

  " Development tools
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-test/vim-test'
  Plug 'puremourning/vimspector'

  " Languages
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'rust-lang/rust.vim'
  Plug 'JuliaEditorSupport/julia-vim'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'

  call plug#end()

  " Use a new leader key
  let mapleader=','

  " Disable arrow keys
  nnoremap <Up> <NOP>
  nnoremap <Down> <NOP>
  nnoremap <Left> <NOP>
  nnoremap <Right> <NOP>

  " Sane defaults
  set clipboard^=unnamedplus
  set expandtab
  set nobackup
  set number
  set shiftround
  set shiftwidth=2
  set softtabstop=2
  set termguicolors

  " Enable Python extensions
  let g:python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'

  " Theme
  colorscheme apprentice
  let g:airline_theme='minimalist'

  " Turn off search highlights
  nnoremap <Leader>x :<C-u>nohlsearch<CR>

  " FZF
  nnoremap <C-p> :<C-u>FZF<CR>
  nnoremap <Leader><Leader> :Files<cr>
  nmap <leader><tab> <plug>(fzf-maps-n)

  " NERDTree
  map <Leader>n :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=1

  " vim-javascript settings
  let g:javascript_conceal_function       = "ƒ"
  let g:javascript_conceal_null           = "ø"
  let g:javascript_conceal_arrow_function = "⇒"
  set conceallevel=1

  " vim-test
  let test#strategy = "neovim"
  nmap <silent> <Leader>t<C-n> :TestNearest<CR>
  nmap <silent> <Leader>t<C-f> :TestFile<CR>
  nmap <silent> <Leader>t<C-s> :TestSuite<CR>
  nmap <silent> <Leader>t<C-l> :TestLast<CR>
  nmap <silent> <Leader>t<C-g> :TestVisit<CR>

" lsp
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.pyls.setup{
  settings = {
    pyls = {
      configurationSources = {'flake8'},
      plugins = {
        pydocstyle = {
          enabled = true,
        },
        pyls_mypy = {
          enabled = true,
          live_mode = true,
        }
      }
    }
  }
}
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

endif
