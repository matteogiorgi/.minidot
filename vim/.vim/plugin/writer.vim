" __        __    _ _
" \ \      / / __(_) |_ ___ _ __
"  \ \ /\ / / '__| | __/ _ \ '__|
"   \ V  V /| |  | | ||  __/ |
"    \_/\_/ |_|  |_|\__\___|_|
"
" Simple utility plugin containings functions
" that helps writing activity within Vim.




" Check {{{
if exists("g:writer")
    finish
endif
" ---
let g:writer = 1
"}}}




" NoteVI {{{
function! s:MakeNote()
    let l:pathFile    = expand('%:p')
    let l:pathParent  = expand('%:p:h')
    let l:pathNotes   = l:pathParent . '/notes'

    let $FILE   = fnamemodify(l:pathFile, ':p')
    let $PARENT = fnamemodify(l:pathParent, ':p')
    let $PREFIX = fnamemodify(l:pathParent, ':t')
    let $NOTES  = fnamemodify(l:pathNotes, ':p')

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
    let accentNone  = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    let accentGrave = ['à', 'è', 'ì', 'ò', 'ù', 'À', 'È', 'Ì', 'Ò', 'Ù']
    let accentAcute = ['á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú']

    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let positionNone  = match(accentNone, character)
    let positionGrave = match(accentGrave, character)
    let positionAcute = match(accentAcute, character)

    if positionNone != -1
        execute ':normal! r' . accentGrave[positionNone]
    endif
    if positionGrave != -1
        execute ':normal! r' . accentAcute[positionGrave]
    endif
    if positionAcute != -1
        execute ':normal! r' . accentNone[positionAcute]
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
command! ToggleAccent call <SID>ToggleAccent()
" ---
nnoremap <localleader>\ :ScratchBuffer<CR>
nnoremap <silent>' :ToggleAccent<CR>
"}}}
