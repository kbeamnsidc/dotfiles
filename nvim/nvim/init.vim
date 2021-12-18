if exists('g:vscode')
  execute 'source '.stdpath('config').'/vscode.vim'
else
  execute 'source '.stdpath('config').'/mid.vim'
endif
