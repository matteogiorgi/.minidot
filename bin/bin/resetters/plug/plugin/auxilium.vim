"     _              _ _ _
"    / \  _   ___  _(_) (_)_   _ _ __ ___
"   / _ \| | | \ \/ / | | | | | | '_ ` _ \
"  / ___ \ |_| |>  <| | | | |_| | | | | | |
" /_/   \_\__,_/_/\_\_|_|_|\__,_|_| |_| |_|
"
" Simple viml-script that enhances your vim
" writing efficiency, nothindg fancy :)




" Check {{{
if exists("g:auxilium")
    finish
endif
" ---
let g:auxilium = 1
"}}}




" Colors {{{
if has('gui_running')
    if filereadable(expand('~/.vim/colors/hemisu.vim'))
        set background=dark
        colorscheme hemisu
    endif
elseif filereadable(expand('~/.vim/colors/noctu.vim'))
    colorscheme noctu
endif
" }}}




" MakeNote {{{
function! s:MakeNote()
    let l:path_file    = expand('%:p')
    let l:path_parent  = expand('%:p:h')
    let l:path_notes   = l:path_parent . '/notes'
    " ---
    let $FILE   = fnamemodify(l:path_file, ':p')
    let $PARENT = fnamemodify(l:path_parent, ':p')
    let $PREFIX = fnamemodify(l:path_parent, ':t')
    let $NOTES  = fnamemodify(l:path_notes, ':p')
    " ---
    if empty(glob(l:path_parent . '/*.md'))
        echo 'no markdown found inside ' . l:path_parent
        return
    endif
    " ---
    if !isdirectory($NOTES)
        execute 'silent !cp -R $HOME/.vim/plugin/notes $PARENT'
    endif
    " ---
    execute 'silent !$NOTES/assets/makenote %:t:r'
    redraw!
    redrawstatus!
    redrawtabline
    echo 'notes archived in ' . l:path_notes
endfunction
"}}}




" ScratchBuffer {{{
function! s:ScratchBuffer()
    let target_buffer = bufnr('/tmp/scratchbuffer')
    let target_window = bufwinnr(target_buffer)
    " ---
    if target_buffer != -1 && target_window != -1
        execute target_window . 'wincmd w'
    else
        execute 'edit /tmp/scratchbuffer'
        setlocal bufhidden=wipe
        setlocal nobuflisted
        setlocal noswapfile
        setlocal filetype=text
    endif
endfunction
"}}}




" AccentToggle {{{
function! s:AccentToggle()
    let accent_none  = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    let accent_grave = ['à', 'è', 'ì', 'ò', 'ù', 'À', 'È', 'Ì', 'Ò', 'Ù']
    let accent_acute = ['á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú']
    " ---
    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let position = index(accent_none + accent_grave + accent_acute, character)
    " ---
    if position != -1
        if position < 10 " accent_none
            let new_char = accent_grave[position % 10]
        elseif position < 20 " accent_grave
            let new_char = accent_acute[position % 10]
        else " accent_acute
            let new_char = accent_none[position % 10]
        endif
        execute ':normal! r' . new_char
    endif
endfunction
"}}}




" Prettyfiers {{{
set cursorline
" ---
augroup netrw_prettyfier
    autocmd FileType netrw setlocal cursorline
augroup end
" ---
augroup linenumber_prettyfier
    autocmd!
    autocmd WinEnter,BufEnter,FocusGained,InsertLeave * set cursorline
    autocmd WinLeave,BufLeave,FocusLost,InsertEnter * set nocursorline
augroup end
" ---
augroup cursorcolumn_prettyfier
    autocmd!
    autocmd InsertEnter *
                \ if &filetype != 'text' && &filetype != 'markdown' && &filetype != 'tex'|
                \     let &colorcolumn = '121,'.join(range(121,999),',')|
                \ endif
    autocmd InsertLeave *
                \ if &filetype != 'text' && &filetype != 'markdown' && &filetype != 'tex'|
                \     set colorcolumn=|
                \ endif
augroup end
"}}}




" Filetype behavior {{{
augroup writer_filetype
    autocmd!
    autocmd FileType markdown,tex,text
                \ setlocal nonu nornu|
                \ setlocal wrap conceallevel=2|
                \ noremap <buffer> j gj|
                \ noremap <buffer> k gk
augroup end
"}}}




" Autosave behavior {{{
augroup scratchbuffer_autosave
    autocmd!
    autocmd TextChanged,TextChangedI /tmp/scratchbuffer silent write
augroup end
"}}}




" Commands & Keymaps {{{
command! MakeNote call <SID>MakeNote()
nnoremap <localleader>s :call <SID>ScratchBuffer()<CR>
nnoremap <silent>' :call <SID>AccentToggle()<CR>
"}}}

" vim: fdm=marker:sw=2:sts=2:et
