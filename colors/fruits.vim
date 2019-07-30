" Vim color scheme Lucid
" ----------------------------------------------------------------------
:let _raspberry = '#f41f68'
:let _snow = '#ffffff'
:let _cloud = '#fbfbfb'
:let _rain_cloud = '#e8e8e8'
:let _coal = '#000000'
:let _grape = '#ab60e6'
:let _blueberry = '#736ee9'
:let _navy = '#402d99'
:let _mint = '#36ba75'
:let _cream = '#fff2dd'
:let _midnight = '#5b5194'
:let _pink = '#f682f1'
:let _pink_light = '#ffe0f5'

:let _black = '#692fd5'
:let _black_bright = '#a4b6da'
:let _red = '#e22b75'
:let _red_bright = '#fc9494'
:let _green = '#01c8ba'
:let _green_bright = '#74efa9'
:let _yellow = '#ff2f6f'
:let _yellow_bright ='#ffca66'
:let _blue = '#2199ff'
:let _blue_bright = '#7daaff'
:let _magenta = '#fd28a2'
:let _magenta_bright = '#ff88e9'
:let _cyan = '#a489fc'
:let _cyan_bright = '#88e7e0'
:let _white = '#002bcf'
:let _white_bright = '#9b61e8'

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let colors_name = "fruits"
let colorgroup = {}


" Interface
" ----------------------------------------------------------------------
let colorgroup['Normal']       = {"GUIFG": _black,     "GUIBG":  _cloud}
" ------------------------
let colorgroup['Darker']       = {"GUIFG": _coal,      "GUIBG":  _rain_cloud}
let colorgroup['ColorColumn']  = {"GUIFG": _snow, "GUIBG":  _rain_cloud}
let colorgroup['Conceal']      = {"GUIFG": _yellow_bright,        "GUI": "bold"}
let colorgroup['Cursor']       = {"GUIFG": _black, "GUIBG":  _rain_cloud}
let colorgroup['CursorLine']   = {"GUIFG": _black,     "GUIBG":  _cream}
let colorgroup['CursorLineNr'] = {"GUIFG": _white_bright, "GUIBG":  _cloud}
let colorgroup['Directory']    = {"GUIFG": _navy,   "GUIBG":  _cloud}
let colorgroup['Error']        = {"GUIFG": _red, "GUIBG":  _cloud}
let colorgroup['ErrorMsg']     = {"GUIFG": _red, "GUIBG":  _cloud}
let colorgroup['FoldColumn']   = {                     "GUIBG":  _grape}
let colorgroup['Folded']       = {"GUIFG": _cloud,     "GUIBG":  _grape}
let colorgroup['LineNr']       = {"GUIFG": _cyan, "GUIBG":  _cloud}
if &background == "light"
  let colorgroup['LineNr']       = {"GUIFG": _black_bright, "GUIBG":  _cloud}
endif
let colorgroup['MatchParen']   = {"GUIFG": _cloud, "GUIBG":  _magenta}
let colorgroup['ModeMsg']      = {"GUIFG": _cloud, "GUIBG":  _green}
let colorgroup['Pmenu']        = {"GUIFG": _coal,     "GUIBG":  _rain_cloud}
let colorgroup['PmenuSel']     = {"GUIFG": _white, "GUIBG":  _cream}
let colorgroup['PmenuSbar']    = {                     "GUIBG":  _cloud}
let colorgroup['Search']       = {                     "GUIBG":  _cream, "GUI": "underline"}
let colorgroup['SignColumn']   = {                     "GUIBG":  _cloud}
let colorgroup['StatusLine']   = {"GUIFG": _white_bright,      "GUIBG":  _cloud}
let colorgroup['StatusLineNC'] = {"GUIFG": _rain_cloud, "GUIBG":  _cloud}
let colorgroup['Title']        = {"GUIFG": _magenta,      "GUI": "bold"}
let colorgroup['Todo']         = {"GUIFG": _yellow, "GUIBG":  _cream}
let colorgroup['VertSplit']    = {"GUIFG": _cloud,      "GUIBG":  _cloud}
let colorgroup['Visual']       = {"GUIFG": _black, "GUIBG":  _cyan_bright}
let colorgroup['WarningMsg']   = {"GUIFG": _white, "GUIBG":  _red_bright}
let colorgroup['TabLine']  = {"GUIFG": _grape, "GUIBG": _cloud}
let colorgroup['TabLineSel'] = {"GUIFG": _cream, "GUIBG": _raspberry}
let colorgroup['TabLineSelShade'] = {"GUIFG": _cream, "GUIBG": _cloud}
let colorgroup['TabLineAlt']    = {"GUIFG": _cream, "GUIBG": _grape}


" Syntax
" ----------------------------------------------------------------------
let colorgroup['Access']       = {"GUIFG": _white_bright,    "GUI": "bold"}
let colorgroup['Comment']      = {"GUIFG": _grape,      "GUI": "italic"}
let colorgroup['Class']        = {"GUIFG": _magenta,      "GUI": "italic"}
let colorgroup['Conditional']  = {"GUIFG": _blue}
let colorgroup['Constant']     = {"GUIFG": _yellow, "GUI": "bold"}
let colorgroup['Delimiter']    = {"GUIFG": _magenta}
let colorgroup['Function']     = {"GUIFG": _magenta_bright}
let colorgroup['Identifier']   = {"GUIFG": _white}
let colorgroup['Module']       = {"GUIFG": _magenta,      "GUI": "underline"}
let colorgroup['NonText']      = {"GUIFG": _rain_cloud}
let colorgroup['Number']       = {"GUIFG": _magenta_bright}
let colorgroup['PreProc']      = {"GUIFG": _yellow}
let colorgroup['Statement']    = {"GUIFG": _magenta}
let colorgroup['Special']      = {"GUIFG": _red}
let colorgroup['SpecialKey']   = {"GUIFG": _yellow}
let colorgroup['String']       = {"GUIFG": _blueberry}
let colorgroup['StorageClass'] = {"GUIFG": _midnight,     "GUI": "bold"}
let colorgroup['Structure']    = {"GUIFG": _white_bright}
let colorgroup['Symbol']       = {"GUIFG": _yellow}
let colorgroup['Type']         = {"GUIFG": _black}
let colorgroup['Underlined']   = {"GUIFG": _black_bright, "GUI": "underline"}
let colorgroup['Userdef']      = {"GUIFG": _red}
" ------------------------
hi link Boolean               Number
hi link Character             Function
hi link ErrorMsg              Error
hi link Debug                 Special
hi link Define                PreProc
hi link Exception             PreProc
hi link Float                 Number
hi link Include               Function
hi link Label                 Statement
hi link Macro                 PreProc
hi link Operator              PreProc
hi link PreCondit             PreProc
hi link Repeat                Statement
hi link SpecialChar           Special
hi link SpecialComment        Special
hi link Typedef               Type
hi link Tag                   Special

" Plugins
" ----------------------------------------------------------------------

" CtrlP
hi link CtrlPMatch            Function

" Git commit
hi link gitcommitBranch        Constant
hi link gitcommitSelectedFile  Statement
hi link gitcommitDiscardedFile Structure
hi link gitcommitUntrackedFile Structure
hi link gitcommitSummary       String

" GitGutter
hi link GitGutterAdd          Darker
hi link GitGutterChange       Darker
hi link GitGutterDelete       Darker
hi link GitGutterChangeDelete Darker

" NERDtree
hi link NerdTreeCWD           Statement
hi link NerdTreeHelpKey       Function
hi link NerdTreeHelpTitle     Statement
hi link NerdTreeOpenable      Statement
hi link NerdTreeClosable      Statement
hi link NerdTreeDir           Normal
hi link NerdTreeDirSlash      Statement

" PlainTasks (.todo)
hi link ptCompleteTask        Number
hi link ptContext             Type
hi link ptSection             Title
hi link ptTask                Normal

" Startify
hi link StartifyNumber        Statement
hi link StartifyBracket       Statement
hi link StartifySection       Title
hi link StartifyPath          Comment
hi link StartifySlash         Comment
hi link StartifyFile          StorageClass


" Language
" ----------------------------------------------------------------------

" Apache
hi link apacheDeclaration     PreProc

" CoffeeScript
hi link coffeeExtendedOp      Function
hi link coffeeObject          Statement
hi link coffeeObjAssign       Function
hi link coffeeParen           Function

" CSS
hi link cssAttr               String
hi link cssClass              Type
hi link cssProp               Identifier
hi link cssSelectorOp         Identifier

" HAML
hi link hamlTag               Function

" HTML
" hi link htmlArg               Symbol
" hi link htmlTag               Constant
hi link htmlTagName           Constant
" hi link htmlEndTag            Function

" JavaScript
hi link javascriptFuncArg     Function
hi link javascriptFuncComma   Function
hi link javascriptFuncDef     Statement
hi link javascriptFuncKeyword Statement
hi link javascriptOpSymbols   Type
hi link javascriptParens      Function
hi link javascriptEndcolons   Function

" Javascript (pangloss/vim-javascript)
hi link jsBraces              Delimiter
hi link jsClassDefinition     Constant
hi link jsClassKeyword        PreProc
hi link jsExtendsKeyword      Function
hi link jsFuncCall            Function
hi link jsModuleKeyword       Identifier
hi link jsNull                Identifier
hi link jsObjectKey           Identifier
hi link jsStorageClass        Structure
hi link jsTemplateBraces      PreProc

" JSON
hi link jsonKeyword           Function

" LaTeX
hi link texInputFile          PreProc
hi link texDocType            Constant
hi link texDocTypeArgs        Function
hi link texInputFile          Symbol
hi link texInputFileOpt       String
hi link texMathMatcher        Statement
hi link texMathSymbol         Symbol
hi link texMathZoneA          Symbol
hi link texMathZoneAS         Symbol
hi link texSection            Title
hi link texStatement          Function
hi link texTypeSize           Symbol
hi link texTypeStyle          Symbol
" hi link texSpecialChar        Userdef

" Markdown
hi link mkdBlockquote         Symbol
hi link mkdCode               Identifier
hi link mkdIndentCode         Identifier
" hi link mkdLink               Normal

" MatchTagAlways
hi link MatchTag              Identifier

" PHP
hi link phpParent             Normal
hi link phpRegion             Comment
hi link phpVarSelector        Identifier

" Ruby
hi link rubyAccess            Access
hi link rubyCallback          Function
hi link rubyClass             Class
hi link rubyControl           Statement
hi link rubyConstant          Constant
hi link rubyEntity            Function
hi link rubyFunction          StorageClass
hi link rubyInclude           Include
hi link rubyInterpolation     Include
hi link rubyMacro             Function
hi link rubyModule            Module
" hi link RubyPseudoVariable    Type
hi link rubyStringDelimiter   rubyString
hi link rubySymbol            Symbol

" SASS
hi link sassClassChar         Type
" " hi link sassExtend            Symbol
" " hi link sassMixing            Symbol
hi link sassIdChar            Identifier
" hi link sassVariable          Function

" Slim
" hi link slimDocType           Function
" hi link slimDocTypeKeyword    Statement
hi link rubyKeyword              PreProc
" hi link slimRubyChar          PreProc
" hi link slimRubyOutputChar    PreProc
" hi link slimText              Normal

" VimL
hi link vimCmdSep             Function

" YAML
hi link yamlBlockMappingKey   Function
hi link yamlDocumentStart     Comment

" XML
hi link xmlEndTag             Function


" Expand colorgroups
" ----------------------------------------------------------------------

let s:colors = {}
" http://choorucode.com/2011/07/29/vim-chart-of-color-names/
let valid_cterm_colors =
      \ [
      \     'Black', 'DarkBlue', 'DarkGreen', 'DarkCyan',
      \     'DarkRed', 'DarkMagenta', 'Brown', 'DarkYellow',
      \     'LightGray', 'LightGrey', 'Gray', 'Grey',
      \     'DarkGray', 'DarkGrey', 'Blue', 'LightBlue',
      \     'Green', 'LightGreen', 'Cyan', 'LightCyan',
      \     'Red', 'LightRed', 'Magenta', 'LightMagenta',
      \     'Yellow', 'LightYellow', 'White',
      \ ]
for key in keys(colorgroup)
  let s:colors = colorgroup[key]
  if has_key(s:colors, 'TERM')
    let term = s:colors['TERM']
  else
    let term = 'NONE'
  endif
  if has_key(s:colors, 'GUI')
    let gui = s:colors['GUI']
  else
    let gui='NONE'
  endif
  if has_key(s:colors, 'GUIFG')
    let guifg = s:colors['GUIFG']
  else
    let guifg='NONE'
  endif
  if has_key(s:colors, 'GUIBG')
    let guibg = s:colors['GUIBG']
  else
    let guibg='NONE'
  endif
  if has_key(s:colors, 'CTERM')
    let cterm = s:colors['CTERM']
  else
    let cterm=gui
  endif
  if has_key(s:colors, 'CTERMFG')
    let ctermfg = s:colors['CTERMFG']
  else
    if index(valid_cterm_colors, guifg) != -1
      let ctermfg=guifg
    else
      let ctermfg='Blue'
    endif
  endif
  if has_key(s:colors, 'CTERMBG')
    let ctermbg = s:colors['CTERMBG']
  else
    if index(valid_cterm_colors, guibg) != -1
      let ctermbg=guibg
    else
      let ctermbg='NONE'
    endif
  endif
  if has_key(s:colors, 'GUISP')
    let guisp = s:colors['GUISP']
  else
    let guisp='NONE'
  endif

  if key =~ '^\k*$'
    execute "hi ".key." term=".term." cterm=".cterm." gui=".gui." ctermfg=".ctermfg." guifg=".guifg." ctermbg=".ctermbg." guibg=".guibg." guisp=".guisp
  endif
endfor
