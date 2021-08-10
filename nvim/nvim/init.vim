if exists('g:vscode')
  execute 'source '.stdpath('config').'/vscode.vim'
else
  let modules = [
        \ 'plugins',
        \ 'basic',
        \ 'dev',
        \ 'lsp',
        \ 'completions'
  \]
  for m in modules
    execute 'source '.stdpath('config').'/'.m.'.vim'
  endfor
endif
