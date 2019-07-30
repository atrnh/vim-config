
" rafi-2017 - hybrid custom
" =========================

" gVim Appearance {{{
" ---------------------------------------------------------
if has('gui_running')
	set guifont=PragmataPro:h16
	" set noantialias
endif
" }}}

" UI elements {{{
" ---------------------------------------------------------
set showbreak=↪
set fillchars=vert:│,fold:─
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·

" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
" }}}

" Tabline {{{
" ---------------------------------------------------------
" TabLineFill: Tab pages line, where there are no labels
hi TabLineFill ctermfg=230 ctermbg=128 guifg=#736ee9 guibg=#ffffff cterm=NONE gui=NONE
" TabLine: Not-active tab page label
hi TabLine     ctermfg=128 ctermbg=128 guifg=#736ee9 guibg=#ffffff cterm=NONE gui=NONE
" TabLineSel: Active tab page label
hi TabLineSel  ctermfg=230 ctermbg=128 guifg=#ffffff guibg=#e695ff cterm=NONE gui=NONE
" Custom
highlight TabLineSelShade  ctermfg=128 ctermbg=128 guifg=#e695ff guibg=#ffffff
highlight TabLineSelAltShade guifg=#ffffff guibg=#e695ff
highlight TabLineAlt       ctermfg=230 ctermbg=128 guifg=#6b6b6b guibg=#e7e5ff
highlight TabLineAltShade  ctermfg=230 ctermbg=128 guifg=#e7e5ff guibg=#ffffff

function! Tabline() abort "{{{
	" Active project tab
	let s:tabline =
		\ '%#TabLineAlt# %{badge#project()}  '.
		\ '%#TabLineAltShade#▓▒░'.
		\ '%#TabLineFill#♥'

	let nr = tabpagenr()
	for i in range(tabpagenr('$'))
		if i + 1 == nr
			" Active tab
			let s:tabline .=
				\ '%#TabLineSelAltShade#%#TabLineSel#  '.
				\ '%'.(i+1).'T%{badge#label('.(i+1).', "▒", "✖")}  '.
				\ '%#TabLineSelShade#%#TabLineFill#'
		else
			" Normal tab
			let s:tabline .=
				\ '%#TabLine#   '.
				\ '%'.(i+1).'T%{badge#label('.(i+1).', "▒", "✖")} '
		endif
	endfor
	" Empty space and session indicator
	let s:tabline .=
		\ '%#TabLineFill#%T%=%#TabLine#%{badge#session("['.fnamemodify(v:this_session, ':t:r').']")}'
	return s:tabline
endfunction "}}}

let &tabline='%!Tabline()'
" }}}

" Statusline {{{
let s:stl  = " %7*%{&paste ? '=' : ''}%*"         " Paste symbol
let s:stl .= "%4*%{&readonly ? '' : '◦'}%*"       " Modifide symbol
let s:stl .= "%6*%{badge#mode('⁈ ', '﹅')}"        " Read-only symbol
let s:stl .= '%*%n'                               " Buffer number
let s:stl .= "%6*%{badge#modified('✦')}%0*"       " Write symbol
let s:stl .= ' %1*%{badge#filename()}%*'          " Filename
let s:stl .= ' %<'                                " Truncate here
let s:stl .= '%( %{badge#branch()} %)'           " Git branch name
let s:stl .= "%4*%(%{badge#trails('⤐ %s')} %)"  " Whitespace
let s:stl .= '%(%{badge#syntax()} %)%*'           " syntax check
let s:stl .= '%='                                 " Align to right
let s:stl .= '%{badge#format()} %4*║%*'           " File format
let s:stl .= '%( %{&fenc} %)'                     " File encoding
let s:stl .= '%4*║%*%( %{&ft} %)'                 " File type
let s:stl .= '%3*▓▒%2* %l/%2c%4p%% '               " Line and column
let s:stl .= '%{badge#indexing()}%*'              " Indexing tags indicator

" Non-active Statusline {{{
let s:stl_nc = " %{badge#mode('⁈ ', '﹅')}%n"   " Readonly & buffer
let s:stl_nc .= "%6*%{badge#modified('✦')}%*"  " Write symbol
let s:stl_nc .= ' %{badge#filename()}'         " Relative supername
let s:stl_nc .= '%='                           " Align to right
let s:stl_nc .= '%{&ft} '                      " File type
" }}}

" Highlights: Statusline {{{
highlight StatusLine   ctermfg=15 ctermbg=231 guifg=#ab60e6 guibg=#ffffff
highlight StatusLineNC ctermfg=14 ctermbg=231 guifg=#e8e8e8 guibg=#fff2dd

" Filepath color
highlight User1 guifg=#fc89a1 guibg=#ffffff ctermfg=251 ctermbg=236
" Line and column information
highlight User2 guifg=#402d99 guibg=#fbfbfb ctermfg=248 ctermbg=239
" Line and column corner arrow
highlight User3 guifg=#fbfbfb guibg=#ffffff ctermfg=239 ctermbg=236
" Buffer # symbol and whitespace or syntax errors
highlight User4 guifg=#e22b75 guibg=#ffffff ctermfg=242 ctermbg=236
" Write symbol
highlight User6 guifg=#36ba75 guibg=#ffffff ctermfg=167 ctermbg=236
" Paste symbol
highlight User7 guifg=#a489fc guibg=#ffffff ctermfg=107 ctermbg=236
" Syntax and whitespace
highlight User8 guifg=#fd28a2 guibg=#ffffff ctermfg=215 ctermbg=236
" }}}

let s:disable_statusline =
	\ 'denite\|defx\|tagbar\|nerdtree\|undotree\|diff\|peekaboo\|sidemenu'

" Toggle Statusline {{{
augroup statusline
	autocmd!
	autocmd FileType,WinEnter,BufWinEnter,BufReadPost *
		\ if &filetype !~? s:disable_statusline
		\ | let &l:statusline = s:stl
		\ | endif
	autocmd WinLeave *
		\ if &filetype !~? s:disable_statusline
		\ | let &l:statusline = s:stl_nc
		\ | endif
augroup END "}}}

" }}}

" Highlights: General GUI {{{
" ---------------------------------------------------------
" highlight! Error  term=NONE cterm=NONE
" highlight! link WarningMsg  Comment
highlight! link pythonSpaceError  NONE
highlight! link pythonIndentError NONE
" highlight! link mkdLineBreak      NONE
highlight! link ExtraWhitespace  SpellBad
highlight! WarningMsg ctermfg=100 guifg=#CCC566
" }}}


" Plugin: Defx icons and highlights {{{
" ---------------------------------------------------------
let g:defx_git#indicators = {
	\ 'Modified'  : '•',
	\ 'Staged'    : '✚',
	\ 'Untracked' : 'ᵁ',
	\ 'Renamed'   : '≫',
	\ 'Unmerged'  : '≠',
	\ 'Ignored'   : 'ⁱ',
	\ 'Deleted'   : '✖',
	\ 'Unknown'   : '⁇'
	\ }

highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
highlight def link Defx_filename_3_Untracked Comment
highlight def link Defx_filename_3_Unknown Comment
highlight def link Defx_filename_3_Renamed Title
highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

" Plugin: NERDTree icons and highlights {{{
" ---------------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
	\ 'Modified':  '·',
	\ 'Staged':    '‧',
	\ 'Untracked': '?',
	\ 'Renamed':   '≫',
	\ 'Unmerged':  '≠',
	\ 'Deleted':   '✃',
	\ 'Dirty':     '⁖',
	\ 'Clean':     '✓',
	\ 'Unknown':   '⁇'
	\ }

let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'

highlight! NERDTreeOpenable ctermfg=132 guifg=#B05E87
highlight! def link NERDTreeClosable NERDTreeOpenable

highlight! NERDTreeFile ctermfg=246 guifg=#999999
highlight! NERDTreeExecFile ctermfg=246 guifg=#999999

highlight! clear NERDTreeFlags
highlight! NERDTreeFlags ctermfg=234 guifg=#1d1f21
highlight! NERDTreeCWD ctermfg=240 guifg=#777777

highlight! NERDTreeGitStatusModified ctermfg=1 guifg=#D370A3
highlight! NERDTreeGitStatusStaged ctermfg=10 guifg=#A3D572
highlight! NERDTreeGitStatusUntracked ctermfg=12 guifg=#98CBFE
highlight! def link NERDTreeGitStatusRenamed Title
highlight! def link NERDTreeGitStatusUnmerged Label
highlight! def link NERDTreeGitStatusDirDirty Constant
highlight! def link NERDTreeGitStatusDirClean DiffAdd
highlight! def link NERDTreeGitStatusUnknown Comment

function! s:NERDTreeHighlight()
	for l:name in keys(g:NERDTreeIndicatorMapCustom)
		let l:icon = g:NERDTreeIndicatorMapCustom[l:name]
		if empty(l:icon)
			continue
		endif
		let l:prefix = index(['Dirty', 'Clean'], l:name) > -1 ? 'Dir' : ''
		let l:hiname = escape('NERDTreeGitStatus'.l:prefix.l:name, '~')
		execute 'syntax match '.l:hiname.' #'.l:icon.'# containedin=NERDTreeFlags'
	endfor

	syntax match hideBracketsInNerdTree "\]" contained conceal containedin=NERDTreeFlags
	syntax match hideBracketsInNerdTree "\[" contained conceal containedin=NERDTreeFlags
	" setlocal conceallevel=3
	" setlocal concealcursor=nvic
endfunction

augroup nerdtree-highlights
	autocmd!
	autocmd FileType nerdtree call s:NERDTreeHighlight()
augroup END
"}}}

" Plugin: Tagbar icons {{{
" ---------------------------------------------------------
let g:tagbar_iconchars = ['▷', '◢']
"}}}

" Plugin: Neomake icons {{{
" ---------------------------------------------------------
let g:neomake_error_sign = {'text': '⚠', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '⌁', 'texthl': 'WarningSyntax'}
let g:neomake_message_sign = {'text': '⌂', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '⊹', 'texthl': 'NeomakeInfoSign'}
"}}}
highlight! WarningSyntax ctermfg=58 guifg=#7d7629

" Plugin: GitGutter icons {{{
" ---------------------------------------------------------
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
"}}}

" Plugin: vim-gitgutter {{{
" ---------------------------------------------------------
highlight! GitGutterAdd ctermfg=22 guifg=#84edb8 ctermbg=NONE guibg=NONE
highlight! GitGutterChange ctermfg=58 guifg=#d9b0fc ctermbg=NONE guibg=NONE
highlight! GitGutterDelete ctermfg=52 guifg=#f79c7e ctermbg=NONE guibg=NONE
highlight! GitGutterChangeDelete ctermfg=52 guifg=#87c7ed ctermbg=NONE guibg=NONE
" }}}

" Plugin: denite {{{
" ---------------------------------------------------------
highlight! clear WildMenu
highlight! link WildMenu CursorLine
highlight! link deniteSelectedLine Type
highlight! link deniteMatchedChar Function
highlight! link deniteMatchedRange Underlined
highlight! link deniteMode Comment
highlight! link deniteSource_QuickfixPosition qfLineNr
" }}}

" Plugin: vim-operator-flashy {{{
" ---------------------------------------------------------
highlight! link Flashy DiffText
" }}}

" Plugin: vim-bookmarks {{{
let g:bookmark_sign = '⚐'
highlight! BookmarkSign            ctermfg=12 guifg=#4EA9D7
highlight! BookmarkAnnotationSign  ctermfg=11 guifg=#EACF49
" }}}

" Plugin: vim-choosewin {{{
" ---------------------------------------------------------
let g:choosewin_label = 'SDFJKLZXCV'
let g:choosewin_overlay_enable = 1
let g:choosewin_statusline_replace = 1
let g:choosewin_overlay_clear_multibyte = 0
let g:choosewin_blink_on_land = 0

let g:choosewin_color_label = {
	\ 'cterm': [ 236, 2 ], 'gui': [ '#555555', '#000000' ] }
let g:choosewin_color_label_current = {
	\ 'cterm': [ 234, 220 ], 'gui': [ '#333333', '#000000' ] }
let g:choosewin_color_other = {
	\ 'cterm': [ 235, 235 ], 'gui': [ '#333333' ] }
let g:choosewin_color_overlay = {
	\ 'cterm': [ 2, 10 ], 'gui': [ '#88A2A4' ] }
let g:choosewin_color_overlay_current = {
	\ 'cterm': [ 72, 64 ], 'gui': [ '#7BB292' ] }
" }}}

" vim: set foldmethod=marker ts=2 sw=0 tw=80 noet :
