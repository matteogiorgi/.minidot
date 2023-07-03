" VIM9 CONFIG {{{
set wildoptions=fuzzy,pum,tagfile
" }}}




" COPILOT CONFIG {{{
function! s:SuggestWord()
    let suggestion = copilot#Accept("")
    let textsuggested = copilot#TextQueuedForInsertion()
    return textsuggested ==# '' ? '' : split(textsuggested, '[ .()\[\]{}]\zs')[0]
endfunction
" ---
inoremap <silent><C-s> <Plug>(copilot-suggest)
inoremap <silent><C-d> <Plug>(copilot-dismiss)
inoremap <silent><C-h> <C-W>
inoremap <silent><C-j> <Plug>(copilot-next)
inoremap <silent><C-k> <Plug>(copilot-previous)
inoremap <script><expr> <C-l> <SID>SuggestWord()
" }}}
