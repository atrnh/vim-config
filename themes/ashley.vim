" Whitespace
set showbreak=↪
set fillchars=vert:│,fold:─
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·

" Highlights: Statusline {{{
highlight StatusLine   ctermfg=15 ctermbg=231 guifg=#6b6b6b guibg=#e7e5ff
highlight StatusLineNC ctermfg=14 ctermbg=231 guifg=#6b6b6b guibg=#ffffff

" Filepath color
highlight User1 guifg=#161464 guibg=#e7e5ff ctermfg=251 ctermbg=236
highlight User2 guifg=#ffffff guibg=#e7e5ff ctermfg=242 ctermbg=236
" Write symbol
highlight User3 guifg=#36ba75 guibg=#e7e5ff ctermfg=167 ctermbg=236
" Paste symbol
highlight User4 guifg=#a489fc guibg=#e7e5ff ctermfg=107 ctermbg=236


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
let g:defx_git#indicators = {
	\ 'Modified'  : '★',
	\ 'Staged'    : '﹢',
	\ 'Untracked' : '⚬',
	\ 'Renamed'   : '≫',
	\ 'Unmerged'  : '≠',
	\ 'Ignored'   : '⊘',
	\ 'Deleted'   : '×',
	\ 'Unknown'   : '⁇'
	\ }

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
