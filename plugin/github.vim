if exists('g:loaded_githubtools')
	finish
endif
let g:loaded_githubtools = 1

function! s:gh_project_dir()
	let l:gitdir = split(gitbranch#dir(getcwd()), '/')
	let l:pdir_index = len(l:gitdir[0:len(l:gitdir) - 1]) - 1
	let l:projdir = join(split(getcwd(), '/')[l:pdir_index:], '/')
	return l:projdir
endfunction

function! s:gh_permalink() range
	let l:fname = expand('%:t')
	let l:start = getpos("'<")[1]
	let l:end = getpos("'>")[1]

	let l:gitdir = gitbranch#dir(getcwd())
	let l:head = readfile(l:gitdir . '/HEAD')[0][5:]
	let l:commit_id = readfile(l:gitdir . '/' . l:head)[0]

	let l:permalink =
		\ 'https://github.com/hackbrightacademy/fellowship/blob/' .
		\ l:commit_id .
		\ '/' . s:gh_project_dir() . '/' . l:fname . '#' .
		\ (l:start == l:end ? 'L' . l:start : 'L' . l:start . '-L' . l:end)

	call system('echo ' . l:permalink . ' | pbcopy')

	echo 'Copied ' . l:permalink . ' to the clipboard!'
endfunction

command! -nargs=0 -range GithubPermalink call s:gh_permalink()
