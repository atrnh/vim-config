" Statusline
" ---

let s:stl  = " %4*%{&paste ? '=' : ''}%*"         " Paste symbol
let s:stl .= "%3*%{&readonly ? '' : '●'}%*"       " Modifide symbol
let s:stl .= "%3*%{badge#mode('⁈', '')}"        " Read-only symbol
let s:stl .= "%3*%{badge#modified('✦')}%0*"       " Write symbol
let s:stl .= '%2*%1* %{badge#filename()} %2*┃%*'          " Filename
let s:stl .= ' %<'                                " Truncate here
let s:stl .= '%='                                 " Align to right
let s:stl .= '%2*┃%* %(%{badge#branch()} %)'           " Git branch name
let s:stl .= '%2*┃%* %2p%% '               " Line and column

" Non-active Statusline
let s:stl_nc = " %{badge#mode('⁈', '﹅')}"   " Readonly & buffer
let s:stl_nc .= "%{badge#modified('✦')}%*"  " Write symbol
let s:stl_nc .= '%{badge#filename()}'         " Relative supername

" Status-line blacklist
let s:disable_statusline =
	\ 'defx\|denite\|vista\|tagbar\|undotree\|diff\|peekaboo\|sidemenu'

function! s:active()
	if &filetype ==# 'defx'
		let &l:statusline = '%y %<%=%{badge#filename()}%= %l/%L'
	elseif &filetype ==# 'magit'
		let &l:statusline = '%y %{badge#gitstatus()}%<%=%{badge#filename()}%= %l/%L'
	elseif &filetype !~# s:disable_statusline
		let &l:statusline = s:stl
	endif
endfunction

function! s:inactive()
	if &filetype ==# 'defx'
		let &l:statusline = '%y %= %l/%L'
	elseif &filetype ==# 'magit'
		let &l:statusline = '%y %{badge#gitstatus()}%= %l/%L'
	elseif &filetype !~# s:disable_statusline
		let &l:statusline = s:stl_nc
	endif
endfunction

augroup user_statusline
	autocmd!

	" Set active/inactive statusline templates
	autocmd VimEnter,ColorScheme,FileType,WinEnter,BufWinEnter * call s:active()
	autocmd WinLeave * call s:inactive()

	" Redraw on Vim events
	autocmd FileChangedShellPost,BufFilePost,BufNewFile,BufWritePost * redrawstatus

	" Redraw on Plugins custom events
	autocmd User ALELintPost,ALEFixPost redrawstatus
	autocmd User NeomakeJobFinished redrawstatus
	autocmd User GutentagsUpdating redrawstatus
	autocmd User CocStatusChange,CocGitStatusChange redrawstatus
	autocmd User CocDiagnosticChange redrawstatus
augroup END

" vim: set ts=2 sw=2 tw=80 noet :
