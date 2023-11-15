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
    let is_uppercase = character == toupper(character)
    let position_none  = match(map(accent_none, 'tolower(v:val)'), tolower(character))
    let position_grave = match(map(accent_grave, 'tolower(v:val)'), tolower(character))
    let position_acute = match(map(accent_acute, 'tolower(v:val)'), tolower(character))
    " ---
    if position_none != -1
        let new_char = accent_grave[position_none]
    elseif position_grave != -1
        let new_char = accent_acute[position_grave]
    elseif position_acute != -1
        let new_char = accent_none[position_acute]
    else
        return
    endif
    " ---
    if is_uppercase
        let new_char = toupper(new_char)
    endif
    execute ':normal! r' . new_char
endfunction
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
