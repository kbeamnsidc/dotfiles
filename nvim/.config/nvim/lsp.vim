" lsp
lua << EOF
local lspconfig = require'lspconfig'

lspconfig.fortls.setup{}

lspconfig.tsserver.setup{
  cmd = { "npx", "typescript-language-server", "--stdio" }
}

lspconfig.julials.setup{}

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