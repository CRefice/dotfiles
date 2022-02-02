" term.vim -- Vim color scheme.
" Author:       Carlo Refice
" Webpage:      https://github.com/CRefice
" Description:  A colorscheme that uses your terminal colors.

hi clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

" Colorscheme name
let g:colors_name = 'term'

" This one is weird. Using regular term colors makes it really unreadable.
" So we'll use extended term colors for this one.
hi CursorLine cterm=NONE gui=NONE ctermbg=236

hi ALEErrorSign cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi ALEVirtualTextError cterm=NONE gui=NONE ctermfg=203 guifg=#eC6a88
hi ALEVirtualTextWarning cterm=NONE gui=NONE ctermfg=209 guifg=#fab795
hi ALEWarningSign cterm=NONE gui=NONE ctermbg=233 ctermfg=209 guibg=#1c1e26 guifg=#fab795
hi Boolean ctermbg=NONE ctermfg=3
hi Character ctermbg=NONE ctermfg=1
hi ColorColumn cterm=NONE gui=NONE ctermbg=235 guibg=#2e303e
hi ColorColumn ctermbg=4 ctermfg=0
hi Comment ctermbg=NONE cterm=italic ctermfg=8
hi Conceal ctermbg=NONE
hi Conditional ctermbg=NONE ctermfg=5
hi Constant cterm=NONE gui=NONE ctermfg=209 guifg=#f09483
hi Constant ctermbg=NONE ctermfg=3
hi Cursor cterm=NONE ctermbg=NONE ctermfg=8
hi CursorColumn cterm=NONE gui=NONE ctermbg=235 guibg=#2e303e
hi CursorColumn ctermbg=8 ctermfg=7
hi CursorLineNr cterm=NONE gui=NONE ctermbg=235 ctermfg=251 guibg=#2a3158 guifg=#cdd1e6
hi CursorLineNr ctermbg=NONE ctermfg=8
hi Define ctermbg=NONE ctermfg=5
hi Delimiter cterm=NONE gui=NONE ctermfg=44 guifg=#21bfc2
hi Delimiter ctermbg=NONE ctermfg=5
hi DiffAdd cterm=NONE gui=NONE ctermbg=238 ctermfg=7 guibg=#45493e guifg=#c0c5b9
hi DiffAdd ctermbg=NONE ctermfg=2
hi DiffChange cterm=NONE gui=NONE ctermbg=23 ctermfg=241 guibg=#384851 guifg=#b3c3cc
hi DiffChange ctermbg=NONE ctermfg=8
hi DiffDelete cterm=NONE gui=NONE ctermbg=52 ctermfg=167 guibg=#53343b guifg=#ceb0b6
hi DiffDelete ctermbg=NONE ctermfg=1
hi DiffText cterm=NONE gui=NONE ctermbg=24 ctermfg=233 guibg=#5b7881 guifg=#1c1e26
hi DiffText ctermbg=NONE ctermfg=4
hi Directory cterm=NONE gui=NONE ctermfg=203 guifg=#e95678
hi Directory ctermbg=NONE ctermfg=4
hi EasyMotionShade cterm=NONE gui=NONE ctermfg=239 guifg=#3d425b
hi EasyMotionTarget cterm=NONE gui=NONE ctermfg=48 guifg=#09f7a0
hi EasyMotionTarget2First cterm=NONE gui=NONE ctermfg=209 guifg=#fab795
hi EasyMotionTarget2Second cterm=NONE gui=NONE ctermfg=209 guifg=#fab795
hi EndOfBuffer cterm=NONE gui=NONE ctermbg=233 ctermfg=236 guibg=#1c1e26 guifg=#2e303e
hi Error cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi Error ctermbg=1 ctermfg=7
hi ErrorMsg cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#ec6a88
hi ErrorMsg ctermbg=NONE ctermfg=8
hi Float ctermbg=NONE ctermfg=5
hi FoldColumn cterm=NONE gui=NONE ctermbg=233 ctermfg=242 guibg=#1c1e26 guifg=#6c6f93
hi FoldColumn ctermbg=NONE ctermfg=7
hi Folded cterm=NONE gui=NONE ctermbg=233 ctermfg=242 guibg=#1c1e26 guifg=#6c6f93
hi Folded ctermbg=NONE ctermfg=8
hi Function cterm=NONE gui=NONE ctermfg=37 guifg=#25b0bc
hi GitGutterAdd cterm=NONE gui=NONE ctermbg=233 ctermfg=48 guibg=#1c1e26 guifg=#09f7a0
hi GitGutterChange cterm=NONE gui=NONE ctermbg=233 ctermfg=109 guibg=#1c1e26 guifg=#e95678
hi GitGutterChangeDelete cterm=NONE gui=NONE ctermbg=233 ctermfg=109 guibg=#1c1e26 guifg=#e95678
hi GitGutterDelete cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi Identifier cterm=italic gui=italic ctermfg=203 guifg=#e95678
hi Identifier ctermbg=NONE ctermfg=4
hi Ignore ctermbg=8 ctermfg=0
hi IncSearch ctermbg=3 ctermfg=0
hi Include cterm=NONE gui=NONE ctermfg=171 guifg=#b877db
hi Include ctermbg=NONE ctermfg=4
hi Keyword ctermbg=NONE ctermfg=5 cterm=BOLD
hi Label ctermbg=NONE ctermfg=3
hi LineNr cterm=NONE gui=NONE ctermbg=233 ctermfg=239 guibg=#1c1e26 guifg=#6c6f93
hi LineNr ctermbg=NONE ctermfg=8
hi MatchParen cterm=NONE gui=NONE ctermbg=237 ctermfg=255 guibg=#3e445e guifg=#ffffff
hi MatchParen ctermbg=1 ctermfg=8
hi ModeMsg ctermbg=NONE ctermfg=2
hi ModeMsg ctermbg=NONE ctermfg=7
hi MoreMsg cterm=NONE gui=NONE ctermfg=48 guifg=#09f7a0
hi MoreMsg ctermbg=NONE ctermfg=2
hi NonText cterm=NONE gui=NONE ctermbg=233 ctermfg=233 guifg=#2e303e guibg=#1c1e26
hi NonText ctermbg=NONE ctermfg=0
hi Normal cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guibg=#1c1e26 guifg=#d5d8da
hi Normal ctermbg=NONE ctermfg=7
hi Number ctermbg=NONE ctermfg=3
hi Operator ctermbg=NONE ctermfg=4
hi Pmenu cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guifg=#1c1e26 guibg=#d5d8da
hi Pmenu ctermbg=8 ctermfg=7
hi PmenuSbar cterm=NONE gui=NONE ctermbg=236 guibg=#3d425b
hi PmenuSbar ctermbg=6 ctermfg=7
hi PmenuSel cterm=NONE gui=NONE ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
hi PmenuSel ctermbg=4 ctermfg=0
hi PmenuThumb cterm=NONE gui=NONE ctermbg=233 guibg=#1c1e26
hi PmenuThumb ctermbg=8 ctermfg=8
hi PreProc cterm=NONE gui=NONE ctermfg=150 guifg=#09f7a0
hi PreProc ctermbg=NONE ctermfg=3
hi Question cterm=NONE gui=NONE ctermfg=150 guifg=#09f7a0
hi Question ctermbg=NONE ctermfg=4
hi QuickFixLine cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guibg=#272c42 guifg=#1c1e26
hi Repeat cterm=BOLD ctermbg=NONE ctermfg=5
hi Search cterm=NONE gui=NONE ctermbg=216 ctermfg=234 guibg=#e4aa80 guifg=#392313
hi Search ctermbg=3 ctermfg=0
hi SignColumn cterm=NONE gui=NONE ctermbg=233 ctermfg=242 guibg=#1c1e26 guifg=#6c6f93
hi Sneak cterm=NONE gui=NONE ctermbg=140 ctermfg=234 guibg=#f09483 guifg=#e95678
hi SneakScope cterm=NONE gui=NONE ctermbg=236 ctermfg=242 guibg=#272c42 guifg=#d5d8da
hi Special cterm=NONE gui=NONE ctermfg=203 guifg=#e95678
hi Special ctermbg=NONE ctermfg=6
hi SpecialChar ctermbg=NONE ctermfg=5
hi SpecialKey cterm=NONE gui=NONE ctermbg=203 ctermfg=235 guibg=#e95678 guifg=#2e303e
hi SpecialKey ctermbg=NONE ctermfg=8
hi SpellBad cterm=undercurl gui=undercurl ctermbg=95 ctermfg=252 guisp=#eC6a88
hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline
hi SpellCap cterm=undercurl gui=undercurl ctermbg=24 ctermfg=252 guisp=#25b0bc
hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline
hi SpellLocal cterm=undercurl gui=undercurl ctermbg=23 ctermfg=203 guisp=#e95678
hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline
hi SpellRare cterm=undercurl gui=undercurl ctermbg=97 ctermfg=252 guisp=#f09483
hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline
hi Statement cterm=bold gui=bold ctermfg=171 guifg=#b877db
hi Statement ctermbg=NONE ctermfg=1
hi StatusLine cterm=reverse gui=reverse ctermbg=234 ctermfg=245 guibg=#17171b guifg=#818596
hi StatusLine ctermbg=7 ctermfg=0
hi StatusLineNC cterm=reverse gui=reverse ctermbg=237 ctermfg=233 guibg=#3e445e guifg=#0f1117
hi StatusLineNC ctermbg=8 ctermfg=0
hi StatusLineTerm cterm=reverse gui=reverse ctermbg=234 ctermfg=245 guibg=#17171b guifg=#818596
hi StatusLineTermNC cterm=reverse gui=reverse ctermbg=237 ctermfg=233 guibg=#3e445e guifg=#0f1117
hi StorageClass cterm=italic gui=italic ctermfg=37 guifg=#25b0bc
hi String cterm=NONE gui=NONE ctermfg=209 guifg=#fab795
hi String ctermbg=NONE ctermfg=2
hi Structure cterm=NONE gui=NONE ctermfg=37 guifg=#25b0bc
hi Structure ctermbg=NONE ctermfg=5
hi SyntasticErrorSign cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi SyntasticStyleErrorSign cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi SyntasticStyleWarningSign cterm=NONE gui=NONE ctermbg=233 ctermfg=209 guibg=#1c1e26 guifg=#fab795
hi SyntasticWarningSign cterm=NONE gui=NONE ctermbg=233 ctermfg=209 guibg=#1c1e26 guifg=#fab795
hi TabLine cterm=NONE gui=NONE ctermbg=245 ctermfg=234 guibg=#818596 guifg=#17171b
hi TabLine ctermbg=NONE ctermfg=8
hi TabLineFill cterm=reverse gui=reverse ctermbg=234 ctermfg=245 guibg=#17171b guifg=#818596
hi TabLineFill ctermbg=NONE ctermfg=8
hi TabLineSel cterm=NONE gui=NONE ctermbg=234 ctermfg=247 guibg=#e95678 guifg=#9a9ca5
hi TabLineSel ctermbg=4 ctermfg=0
hi Tag ctermbg=NONE ctermfg=3
hi TermCursorNC ctermbg=3 ctermfg=0
hi Title cterm=bold gui=bold ctermfg=37 guifg=#25b0bc
hi Title ctermbg=NONE ctermfg=4
hi Todo cterm=inverse,bold gui=inverse,bold ctermbg=59 ctermfg=48 guibg=#45493e guifg=#09f7a0
hi Todo ctermbg=2 ctermfg=0
hi Type cterm=NONE gui=NONE ctermfg=209 guifg=#fab795
hi Type ctermbg=NONE ctermfg=3
hi Typedef ctermbg=NONE ctermfg=3
hi Underlined cterm=underline gui=underline ctermfg=37 guifg=#25b0bc
hi Underlined ctermbg=NONE ctermfg=1 cterm=underline
hi VertSplit cterm=bold gui=bold ctermbg=233 ctermfg=233 guibg=#0f1117 guifg=#0f1117
hi VertSplit ctermbg=8 ctermfg=0
hi Visual cterm=NONE gui=NONE ctermbg=236 guibg=#272c42
hi Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse
hi VisualNOS ctermbg=NONE ctermfg=1
hi WarningMsg cterm=NONE gui=NONE ctermbg=233 ctermfg=203 guibg=#1c1e26 guifg=#eC6a88
hi WarningMsg ctermbg=1 ctermfg=0
hi WildMenu cterm=NONE gui=NONE ctermbg=255 ctermfg=234 guibg=#d4d5db guifg=#17171b
hi WildMenu ctermbg=2 ctermfg=0
hi ZenSpace cterm=NONE gui=NONE ctermbg=203 guibg=#eC6a88
hi diffAdded cterm=NONE gui=NONE ctermfg=48 guifg=#09f7a0
hi diffRemoved cterm=NONE gui=NONE ctermfg=203 guifg=#eC6a88
hi helpLeadBlank ctermbg=NONE ctermfg=7
hi helpNormal ctermbg=NONE ctermfg=7
hi signColumn ctermbg=NONE ctermfg=4

hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot Normal
hi! link cssPseudoClassId Special
hi! link cssTagName Statement
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsonQuote Normal
hi! link phpVarSelector Identifier
hi! link pythonFunction Title
hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link sassClass Special
hi! link shFunction Normal
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar Normal
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar Normal
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
hi! link CtrlPPrtCursor Cursor
hi! link CtrlPMatch Title
hi! link CtrlPMode2 StatusLine
hi! link deniteMatched Normal
hi! link deniteMatchedChar Title
hi! link jsFlowMaybe Normal
hi! link jsFlowObject Normal
hi! link jsFlowType PreProc
hi! link graphqlName Normal
hi! link graphqlOperator Normal
hi! link jsArrowFunction Operator
hi! link jsClassDefinition Normal
hi! link jsClassFuncName Title
hi! link jsExport Statement
hi! link jsFuncName Title
hi! link jsFutureKeys Statement
hi! link jsFuncCall Normal
hi! link jsGlobalObjects Statement
hi! link jsModuleKeywords Statement
hi! link jsModuleOperators Statement
hi! link jsNull Constant
hi! link jsObjectFuncName Title
hi! link jsObjectKey Identifier
hi! link jsSuper Statement
hi! link jsTemplateBraces Special
hi! link jsUndefined Constant
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link ngxDirective Statement
hi! link plug1 Normal
hi! link plug2 Identifier
hi! link plugDash Comment
hi! link plugMessage Special
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignChangeDelete GitGutterChangeDelete
hi! link SignifySignDelete GitGutterDelete
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link StartifyBracket Comment
hi! link StartifyFile Identifier
hi! link StartifyFooter Constant
hi! link StartifyHeader Constant
hi! link StartifyNumber Special
hi! link StartifyPath Comment
hi! link StartifySection Statement
hi! link StartifySlash Comment
hi! link StartifySpecial Normal
hi! link svssBraces Delimiter
hi! link swiftIdentifier Normal
hi! link typescriptAjaxMethods Normal
hi! link typescriptBraces Normal
hi! link typescriptEndColons Normal
hi! link typescriptFuncKeyword Statement
hi! link typescriptGlobalObjects Statement
hi! link typescriptHtmlElemProperties Normal
hi! link typescriptIdentifier Statement
hi! link typescriptMessage Normal
hi! link typescriptNull Constant
hi! link typescriptParens Normal
