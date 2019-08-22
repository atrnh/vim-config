
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
highlight TabLineAlt       ctermfg=230 ctermbg=128 guifg=#6b6b6b guibg=#e7e5ff
highlight TabLineAltShade  ctermfg=230 ctermbg=128 guifg=#e7e5ff guibg=#ffffff

" Highlights: Statusline {{{
highlight StatusLine   ctermfg=15 ctermbg=231 guifg=#ab60e6 guibg=#ffffff
highlight StatusLineNC ctermfg=14 ctermbg=231 guifg=#b8b8d7 guibg=#ffffff

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

" Highlights: General GUI {{{
" ---------------------------------------------------------
" highlight! Error  term=NONE cterm=NONE
" highlight! link WarningMsg  Comment
highlight! link pythonSpaceError  NONE
highlight! link pythonIndentError NONE
" highlight! link mkdLineBreak      NONE
highlight! link ExtraWhitespace  SpellBad
" }}}


" Plugin: Defx icons and highlights {{{
" ---------------------------------------------------------
" let g:defx_git#indicators = {
"	\ 'Modified'  : '•',
"	\ 'Staged'    : '✚',
"	\ 'Untracked' : 'ᵁ',
"	\ 'Renamed'   : '≫',
"	\ 'Unmerged'  : '≠',
"	\ 'Ignored'   : 'ⁱ',
"	\ 'Deleted'   : '✖',
"	\ 'Unknown'   : '⁇'
"	\ }
"
" highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
" highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
" highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
" highlight def link Defx_filename_3_Untracked Comment
" highlight def link Defx_filename_3_Unknown Comment
" highlight def link Defx_filename_3_Renamed Title
" highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

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

" vim: set foldmethod=marker ts=2 sw=0 tw=80 noet :
