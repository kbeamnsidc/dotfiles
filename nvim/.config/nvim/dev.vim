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
