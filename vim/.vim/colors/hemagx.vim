"  _   _
" | | | | ___ _ __ ___   __ _  __ ___  __
" | |_| |/ _ \ '_ ` _ \ / _` |/ _` \ \/ /
" |  _  |  __/ | | | | | (_| | (_| |>  <
" |_| |_|\___|_| |_| |_|\__,_|\__, /_/\_\
"                             |___/
" A Hemisu variant with Apprentice colors.
" Matteo Giorgi  (https://www.geoteo.net/)




" SETUP {{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
    syntax reset
endif

" Declare theme name
let g:colors_name = "hemagx"
" }}}




" THE COLORS {{{
" check more Xterm256 color names for console Vim at:
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

" Define reusable colors
let s:black            = { "gui": "#000000", "cterm": "16"  }
let s:almostBlack      = { "gui": "#111111", "cterm": "233" }
" ---
let s:white            = { "gui": "#FFFFFF", "cterm": "231" }
let s:almostWhite      = { "gui": "#EEEEEE", "cterm": "255" }
" ---
let s:darkGrey         = { "gui": "#444444", "cterm": "238" }
let s:middleDarkGrey   = { "gui": "#777777", "cterm": "241" }
let s:middleLightGrey  = { "gui": "#999999", "cterm": "246" }
let s:lightGrey        = { "gui": "#BBBBBB", "cterm": "249" }
" ---
let s:darkPink         = { "gui": "#63001C", "cterm": "88"  }
let s:middleDarkPink   = { "gui": "#CC241D", "cterm": "124" }
let s:middleLightPink  = { "gui": "#D3869B", "cterm": "175" }
let s:lightPink        = { "gui": "#FFAFAF", "cterm": "217" }
" ---
let s:darkBlue         = { "gui": "#5F87AF", "cterm": "67"  }
let s:middleDarkBlue   = { "gui": "#5F5F87", "cterm": "60"  }
let s:middleLightBlue  = { "gui": "#8787AF", "cterm": "103" }
let s:lightBlue        = { "gui": "#87AFD7", "cterm": "110" }
" ---
let s:darkGreen        = { "gui": "#87875F", "cterm": "101" }
let s:middleDarkGreen  = { "gui": "#5F875F", "cterm": "65"  }
let s:middleLightGreen = { "gui": "#87AF87", "cterm": "108" }
let s:lightGreen       = { "gui": "#FFFFAF", "cterm": "229" }
" ---
let s:darkTan          = { "gui": "#AF5F5F", "cterm": "131" }
let s:lightTan         = { "gui": "#FF8700", "cterm": "208" }

" Assign to semantic categories based on background color
if &background == "dark"
    " Dark theme
    let s:bg         = s:black
    let s:norm       = s:almostWhite
    let s:comment    = s:middleDarkGrey
    let s:dimmed     = s:middleLightGrey
    let s:subtle     = s:darkGrey
    let s:faint      = s:almostBlack
    let s:accent1    = s:middleLightBlue
    let s:accent2    = s:middleLightGreen
    let s:accent3    = s:lightGreen
    let s:accent4    = s:lightTan
    let s:normRed    = s:middleLightPink
    let s:normGreen  = s:middleLightGreen
    let s:normBlue   = s:middleLightBlue
    let s:faintRed   = s:darkPink
    let s:faintGreen = s:darkGreen
    let s:faintBlue  = s:darkBlue
else
    " Light theme
    let s:bg         = s:white
    let s:norm       = s:almostBlack
    let s:comment    = s:middleLightGrey
    let s:dimmed     = s:middleDarkGrey
    let s:subtle     = s:lightGrey
    let s:faint      = s:almostWhite
    let s:accent1    = s:middleDarkBlue
    let s:accent2    = s:middleDarkGreen
    let s:accent3    = s:middleDarkPink
    let s:accent4    = s:darkTan
    let s:normRed    = s:middleDarkPink
    let s:normGreen  = s:middleDarkGreen
    let s:normBlue   = s:middleDarkBlue
    let s:faintRed   = s:lightPink
    let s:faintGreen = s:lightGreen
    let s:faintBlue  = s:lightBlue
endif
" }}}




" UTILITY FUNCTION {{{
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction
" }}}




" HIGHLIGHTS - VIM>=7 {{{
if version >= 700
    call s:h("CursorLineNr",  { "gui": "bold", "cterm": "bold" })
    call s:h("CursorLine",    { "bg": s:faint })
    call s:h("MatchParen",    { "fg": s:norm, "bg": s:subtle, "gui": "bold", "cterm": "bold" })
    call s:h("Pmenu",         { "bg": s:faint })
    call s:h("PmenuThumb",    { "bg": s:norm })
    call s:h("PmenuSBar",     { "bg": s:subtle })
    call s:h("PmenuSel",      { "bg": s:faintBlue })
    call s:h("ColorColumn",   { "bg": s:faintRed })
    call s:h("SpellBad",      { "sp": s:normRed, "gui": "undercurl" })
    call s:h("SpellCap",      { "sp": s:accent1, "gui": "undercurl" })
    call s:h("SpellRare",     { "sp": s:normGreen, "gui": "undercurl" })
    call s:h("SpellLocal",    { "sp": s:accent4, "gui": "undercurl" })
    " ---
    hi! link CursorColumn CursorLine

    " Use background for cterm Spell*, which does not support undercurl
    execute "hi! SpellBad   ctermbg=" s:faintRed.cterm
    execute "hi! SpellCap   ctermbg=" s:faintBlue.cterm
    execute "hi! SpellRare  ctermbg=" s:faintGreen.cterm
    execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif
" }}}




" HIGHLIGHTS - UI {{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent3 })
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue })
call s:h("Search",       { "bg": s:faintGreen })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("VertSplit",    { "fg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })
" ---
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link LineNr       NonText
hi! link SpecialKey   NonText
" }}}




" HIGHLIGHTS - GENERIC SYNTAX {{{
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Conceal",    { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
" ---
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg
" }}}




" HIGHLIGHTS - HTML {{{
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag
" }}}




" HIGHLIGHTS - CSS {{{
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal
" }}}




" HIGHLIGHTS - MARKDOWN {{{
hi! link mkdListItem  mkdDelimiter
" }}}




" HIGHLIGHTS - SHELL {{{
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter
" }}}




" HIGHLIGHTS - JAVASCRIPT {{{
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal
" }}}




" HIGHLIGHTS - HELP {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined
" }}}

" vim: fdm=marker:sw=2:sts=2:et