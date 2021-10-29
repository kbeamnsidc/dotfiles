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
