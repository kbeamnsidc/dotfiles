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
