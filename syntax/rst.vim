if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:sw = shiftwidth()

syn match rstTransition /^[=`:.'"~^_*+#-]\{4,}\s*$/

syn cluster rstDirectives contains=rstDirective,rstSections,rstExDirective
syn cluster rstCruft contains=rstEmphasis,rstStrongEmphasis,
	\ rstInterpretedText,rstInlineLiteral,rstSubstitutionReference,
	\ rstInlineInternalTargets,rstFootnoteReference,rstHyperlinkReference,
	\ rstCitationReference,rstCitation,rstInterpretedTextOrHyperlinkReference,
	\ rstInlineOption

syn region rstDirective start="^\_S" skip="^\_S" end="^\s\@!"
	\ matchgroup=rstSections contains=@rstDirectives,@rstCruft

function! s:DefineOneInlineMarkup(name, start, middle, end, char_left, char_right)
  execute 'syn region rst' . a:name .
        \ ' start=+' . a:char_left . '\zs' . a:start .
        \ '\ze[^[:space:]' . a:char_right . a:start[strlen(a:start) - 1] . ']+' .
        \ a:middle .
        \ ' end=+\S' . a:end . '\ze\%($\|\s\|[''"’)\]}>/:.,;!?\\-]\)+'
endfunction

function! s:DefineInlineMarkup(name, start, middle, end)
  let middle = a:middle != "" ?
        \ (' skip=+\\\\\|\\' . a:middle . '+') :
        \ ""

  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, "'", "'")
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '"', '"')
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '(', ')')
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '\[', '\]')
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '{', '}')
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '<', '>')
  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '’', '’')
  " TODO: Additional Unicode Pd, Po, Pi, Pf, Ps characters

  call s:DefineOneInlineMarkup(a:name, a:start, middle, a:end, '\%(^\|\s\|\%ua0\|[/:]\)', '')

  execute 'syn match rst' . a:name .
        \ ' +\%(^\|\s\|\%ua0\|[''"([{</:]\)\zs' . a:start .
        \ '[^[:space:]' . a:start[strlen(a:start) - 1] . ']'
        \ a:end . '\ze\%($\|\s\|[''")\]}>/:.,;!?\\-]\)+'

  execute 'hi def link rst' . a:name . 'Delimiter' . ' rst' . a:name
endfunction

call s:DefineInlineMarkup('Emphasis', '\*', '\*', '\*')
call s:DefineInlineMarkup('StrongEmphasis', '\*\*', '\*', '\*\*')
call s:DefineInlineMarkup('InterpretedTextOrHyperlinkReference', '`', '`', '`_\{0,2}')
call s:DefineInlineMarkup('InlineLiteral', '``', "", '``')
call s:DefineInlineMarkup('SubstitutionReference', '|', '|', '|_\{0,2}')
call s:DefineInlineMarkup('InlineInternalTargets', '_`', '`', '`')
call s:DefineInlineMarkup('InlineOption', '\:', '\:', '\:')

syn match   rstSections "\v^%(([=`:.'"~^_*+#-])\1+\n)?.{1,2}\n([=`:.'"~^_*+#-])\2+$"
	\ contains=@Spell
syn match   rstSections "\v^%(([=`:.'"~^_*+#-])\1{2,}\n)?.{3,}\n([=`:.'"~^_*+#-])\2{2,}$"
	\ contains=@Spell
syn match rstSections "\v^(\s+).{1,2}\n\1[=`:.'"~^_*+#-]{1,2}$"
syn match rstSections "\v^(\s+).{2,}\n\1[=`:.'"~^_*+#-]{2,}$"


let s:alphanum = '[:lower:][:upper:][:digit:]'
let s:ReferenceName = '['.s:alphanum.']\%([-_.:+]\?['.s:alphanum.']\+\)*'
" [[:lower:][:upper:][:digit:]]\%([-_.:+]\?[[:lower:][:upper:][:digit:]]\+\)*

function! s:DefineRegion(region_dict)
	let opts = ''
	for [k, v] in items(a:region_dict['opts'])
		let opts .= v == k ? k.' ' : k.'='.v.' '
	endfor
	exec 'syn region '.a:region_dict['name'].' start='.a:region_dict['start'].
		\ (has_key(a:region_dict, 'skip') ? ' skip='.a:region_dict['skip'] : '').
		\' end='.a:region_dict['end'].' '.opts
endfunction

" No indentation
call s:DefineRegion({
	\'name': 'rstExDirective',
	\'start': '+^\.\.\s'.s:ReferenceName.'::.*$+',
	\'skip': '"^[[:blank:]]\{'.s:sw.'}"',
	\'end': '"^\s\@!"',
	\'opts': {
	\    'contains': 'rstExDirectiveArgs,@rstDirectives',
	\    'nextgroup': '@rstDirectives'
	\    }
	\})

call s:DefineRegion({
	\'name': 'rstExDirective',
	\'start': '+^\z([[:blank:]]\{'.s:sw.',}\)\.\.\s'.s:ReferenceName.'::.*$+',
	\'skip': '"^\z1\{2,}"',
	\'end': '"^\z1\@!"',
	\'opts': {
	\    'contains': 'rstExDirectiveArgs,@rstDirectives',
	\    'contained': 'contained',
	\    'nextgroup': '@rstDirectives'
	\    }
	\})

call s:DefineRegion({
	\ 'name': 'rstExDirectiveArgs',
	\ 'start': '"\.\."',
	\ 'end': '"^\s\@!"',
	\ 'opts': {
	\    'contained': 'contained',
	\    'extend': 'extend',
	\    'contains': 'rstDirectiveName,rstExOption',
	\    }
	\})

call s:DefineRegion({
	\ 'name': 'rstExOption',
	\ 'start': '":"',
	\ 'end': '"^\s\@!"',
	\ 'opts': {
	\     'contains': 'rstExOptionName,rstExOptionArg',
	\     'contained': 'contained',
	\     'extend': 'extend'
	\     }
	\ })

syn match rstDirectiveName "\.\.\s\S\+::.*\s\@!" contained extend
syn match rstExOptionName "\v:[[:lower:][:upper:]][[:lower:][:upper:][:digit:]_\-]*:"
	\ contained extend

syn region rstCodeBlock contained matchgroup=rstDirective
	\ start=+\%(sourcecode\|code\%(-block\)\=\)::\s\+.*\_s*\n\ze\z(\s\+\)+
	\ skip=+^$+
	\ end=+^\z1\@!+
	\ contains=@NoSpell
syn cluster rstDirectives add=rstCodeBlock

if !exists('g:rst_syntax_code_list')
	let g:rst_syntax_code_list = {
	\ 'vim': ['vim'],
	\ 'python': ['python'],
	\ 'perl': ['perl'],
	\ 'sh': ['sh', 'bash', 'shell'],
	\ 'javascript': ['js', 'jsx', 'javascript']
	\ }
endif

for s:filetype in keys(g:rst_syntax_code_list)
	unlet! b:current_syntax
	" guard against setting 'isk' option which might cause problems (issue #108)
	let prior_isk = &l:iskeyword
	let s:alias_pattern = ''
	\.'\%('
	\.join(g:rst_syntax_code_list[s:filetype], '\|')
	\.'\)'

	exe 'syn include @rst'.s:filetype.' syntax/'.s:filetype.'.vim'
	exe 'syn region rstDirective'.s:filetype
	\.' matchgroup=rstDirective fold'
	\.' start="\c\%(sourcecode\|code\%(-block\)\=\)::\s\+'.s:alias_pattern.'\_s*\n\ze\z(\s\+\)"'
	\.' skip=#^$#'
	\.' end=#^\z1\@!#'
	\.' contains=@NoSpell,@rst'.s:filetype
	exe 'syn cluster rstDirectives add=rstDirective'.s:filetype

	" reset 'isk' setting, if it has been changed
	if &l:iskeyword !=# prior_isk
		let &l:iskeyword = prior_isk
	endif
	unlet! prior_isk
endfor

syn sync minlines=50 linebreaks=2

hi link rstDirective Normal

" hi def link rstDirectiveStart Keyword
hi def link rstExArg Identifier
hi def link rstDirectiveName Identifier
hi def link rstCodeLiteral Define
hi def link rstSections Title
hi def link rstExOption String
hi def link rstExOptionName Keyword
hi def rstStrong gui=bold
hi def rstEmphasis gui=italic
hi def rstStrongEmphasis gui=bold,italic
hi def link rstRole Function
hi def link rstRef Class
hi def link rstExtRef Function
hi def link rstInlineLiteral String
hi def link rstSubstitutionReference PreProc
hi def link rstInlineInternalTargets Identifier
hi def link rstFootnoteReference Identifier
hi def link rstCitationReference Identifier
hi def link rstHyperLinkReference Identifier
hi def link rstStandaloneHyperlink Identifier
hi def link rstInlineOption Special
hi def link rstInterpretedTextOrHyperlinkReference Symbol
let b:current_syntax = 'rst'

