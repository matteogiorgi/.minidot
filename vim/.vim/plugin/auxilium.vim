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
    if !isdirectory($NOTES)
        !cp -R $HOME/.vim/plugin/notes $PARENT
    endif
    !$NOTES/assets/makenote %:t:r
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




" ToggleAccent {{{
function! s:ToggleAccent()
    let accent_none  = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    let accent_grave = ['à', 'è', 'ì', 'ò', 'ù', 'À', 'È', 'Ì', 'Ò', 'Ù']
    let accent_acute = ['á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú']
    " ---
    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let position_none  = match(accent_none, character)
    let position_grave = match(accent_grave, character)
    let position_acute = match(accent_acute, character)
    " ---
    if position_none != -1
        execute ':normal! r' . accent_grave[position_none]
    endif
    if position_grave != -1
        execute ':normal! r' . accent_acute[position_grave]
    endif
    if position_acute != -1
        execute ':normal! r' . accent_none[position_acute]
    endif
endfunction
"}}}




" Filetype behavior {{{
augroup writer_filetype
    autocmd!
    autocmd FileType markdown,latex,text
                \ setlocal wrap conceallevel=2|
                \ nmap <buffer> j gj|
                \ nmap <buffer> k gk
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
command! ScratchBuffer call <SID>ScratchBuffer()
" ---
nnoremap <silent>' :call <SID>ToggleAccent()<CR>
nnoremap <localleader><localleader> :ScratchBuffer<CR>
"}}}
