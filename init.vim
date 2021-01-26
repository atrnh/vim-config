if exists("g:vscode")
	execute 'source ~/.config/nvim/config/vscodevimrc'
else
	execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
endif


