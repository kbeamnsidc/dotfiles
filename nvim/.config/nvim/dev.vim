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
