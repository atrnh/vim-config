setlocal foldmethod=indent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=80
setlocal expandtab
setlocal smarttab
setlocal nosmartindent

let g:rst_syntax_code_list = {
	\ 'vim': ['vim'],
  \ 'java': ['java'],
  \ 'cpp': ['cpp', 'c++'],
  \ 'lisp': ['lisp'],
  \ 'php': ['php'],
  \ 'python': ['python'],
  \ 'perl': ['perl'],
  \ 'sh': ['sh'],
	\ 'javascript': ['javascript', 'jsx'],
  \ }
let g:table_mode_corner_corner = '+'
let g:table_mode_header_fillchar = '='
