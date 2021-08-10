lua << EOF
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = "/tmp/test_dap_install/",
	verbosely_call_debuggers = true,
})
EOF

lui require('dapui').setup()

" lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

" nvim-dap-python
" nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
" nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
