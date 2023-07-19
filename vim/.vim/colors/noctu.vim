"  _   _            _
" | \ | | ___   ___| |_ _   _
" |  \| |/ _ \ / __| __| | | |
" | |\  | (_) | (__| |_| |_| |
" |_| \_|\___/ \___|\__|\__,_|
"
" Noah Frederick (http://noahfrederick.com/)
" Matteo Giorgi  (https://www.geoteo.net/)
" ---
" Vim-color scheme for 16-color terminals:
" noctu will use the terminal's defaults.
" ---
" Black -> (0, 8)     Red     -> (4, 12)
" Blue  -> (1, 9)     Magenta -> (5, 13)
" Green -> (2, 10)    Yellow  -> (6, 14)
" Cyan  -> (3, 11)    Gray    -> (7, 15)




" Scheme setup {{{
set notermguicolors
set t_Co=16
" ---
hi! clear
if exists("syntax_on")
    syntax reset
endif
" ---
let g:colors_name="noctu"
set background=dark
"}}}




" Vim UI {{{
hi Normal        ctermfg=15  ctermbg=NONE
hi Cursor        ctermfg=0   ctermbg=14
hi CursorLine                ctermbg=0     cterm=NONE
hi MatchParen    ctermfg=15  ctermbg=8     cterm=bold
hi Pmenu         ctermfg=15  ctermbg=0
hi PmenuThumb                ctermbg=7
hi PmenuSBar                 ctermbg=8
hi PmenuSel      ctermfg=15  ctermbg=4     cterm=bold
hi ColorColumn               ctermbg=0
hi SpellBad      ctermfg=15  ctermbg=1
hi SpellCap      ctermfg=15  ctermbg=8
hi SpellLocal    ctermfg=15  ctermbg=4
hi SpellRare     ctermfg=15  ctermbg=5
hi NonText       ctermfg=8
hi LineNr        ctermfg=8   ctermbg=NONE
hi CursorLineNr  ctermfg=11  ctermbg=NONE  cterm=bold
hi Visual        ctermfg=0   ctermbg=12
hi IncSearch     ctermfg=0   ctermbg=13    cterm=NONE
hi Search        ctermfg=0   ctermbg=10
hi StatusLine    ctermfg=7   ctermbg=0     cterm=bold
hi StatusLineNC  ctermfg=8   ctermbg=0     cterm=bold
hi VertSplit     ctermfg=0   ctermbg=NONE  cterm=NONE
hi TabLine       ctermfg=8   ctermbg=0     cterm=NONE
hi TabLineSel    ctermfg=7   ctermbg=0     cterm=bold
hi Folded        ctermfg=6   ctermbg=0     cterm=bold
hi Conceal       ctermfg=6   ctermbg=NONE
hi Directory     ctermfg=12
hi Title         ctermfg=3                 cterm=bold
hi ErrorMsg      ctermfg=15  ctermbg=1
hi DiffAdd       ctermfg=0   ctermbg=2
hi DiffChange    ctermfg=0   ctermbg=3
hi DiffDelete    ctermfg=0   ctermbg=1
hi DiffText      ctermfg=0   ctermbg=11    cterm=bold
" ---
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText
"}}}




" Generic syntax {{{
hi Delimiter   ctermfg=7
hi Comment     ctermfg=8                 cterm=italic
hi Underlined  ctermfg=4                 cterm=underline
hi Type        ctermfg=4
hi String      ctermfg=11
hi Keyword     ctermfg=2
hi Todo        ctermfg=1   ctermbg=NONE
hi Function    ctermfg=4                 cterm=bold
hi Identifier  ctermfg=7                 cterm=bold
hi Statement   ctermfg=2                 cterm=bold
hi Constant    ctermfg=13
hi Number      ctermfg=12
hi Boolean     ctermfg=4
hi Special     ctermfg=13
hi Ignore      ctermfg=0
hi PreProc     ctermfg=8                 cterm=bold
" ---
hi! link Operator  Delimiter
hi! link Error     ErrorMsg
"}}}

" vim: fdm=marker:sw=2:sts=2:et
