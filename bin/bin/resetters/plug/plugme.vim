"  ____  _
" |  _ \| |_   _  __ _ _ __ ___   ___
" | |_) | | | | |/ _` | '_ ` _ \ / _ \
" |  __/| | |_| | (_| | | | | | |  __/
" |_|   |_|\__,_|\__, |_| |_| |_|\___|
"                |___/
"
" Simple viml-script that sets basic
" configuration for installed plugins.
" Vim 9.0+ required just for copilot.




" SIGNIFY CONFIG {{{
if &rtp =~ 'signify'
    nnoremap <leader>g :SignifyDiff<CR>
endif
" }}}




" ALE CONFIG {{{
if &rtp =~ 'ale'
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc
    " ---
    inoremap <silent><C-c> :AleComplete<CR>
    nnoremap <leader>n :ALENextWrap<CR>
    nnoremap <leader>p :ALEPreviousWrap<CR>
    nnoremap <leader>s :ALEFindReferences<CR>
    nnoremap <leader>d :ALEGoToDefinition<CR>
endif
" }}}




" CTRLP CONFIG
if &rtp =~ 'ctrlp'
    function! s:Ctags()
        if !executable('ctags')
            echo "ctags not installed"
            return
        endif
        " ---
        execute 'silent !ctags -R --exclude=.git'
        redraw!|redrawstatus!|redrawtabline
        echo "ctags executed"
    endfunction
    " ---
    let g:ctrlp_map = ''
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_custom_ignore = {
                \      'dir': '\v[\/]\.(git|hg|svn)$',
                \      'file': '\v\.(exe|so|dll)$'
                \ }
    " ---
    augroup netrw_prettyfier
        autocmd FileType netrw nmap <buffer> <leader>f :CtrlP<space>%:p:h<CR>
    augroup end
    " ---
    command! Ctags call s:Ctags()
    nnoremap <leader>q :CtrlPQuickfix<CR>
    nnoremap <leader>u :CtrlPUndo<CR>
    nnoremap <leader>i :CtrlPChange<CR>
    nnoremap <leader>f :CtrlP<space>%:p:h<CR>
    nnoremap <leader>h :CtrlPMRUFiles<CR>
    nnoremap <leader>j :CtrlPBuffer<CR>
    nnoremap <leader>k :CtrlPTag<CR>
    nnoremap <leader>l :CtrlPLine<CR>
endif
" }}}




" COPILOT CONFIG {{{
if &rtp =~ 'copilot'
    function! s:SuggestWord()
        let suggestion = copilot#Accept("")
        let textsuggested = copilot#TextQueuedForInsertion()
        return textsuggested ==# '' ? '' : split(textsuggested, '[ .()\[\]{}]\zs')[0]
    endfunction
    " ---
    let g:copilot_enabled = v:true
    nnoremap <leader>a :Copilot panel<CR>
    " ---
    inoremap <silent><C-s> <Plug>(copilot-suggest)
    inoremap <silent><C-d> <Plug>(copilot-dismiss)
    inoremap <silent><C-h> <C-w>
    inoremap <silent><C-j> <Plug>(copilot-next)
    inoremap <silent><C-k> <Plug>(copilot-previous)
    inoremap <script><expr> <C-l> <SID>SuggestWord()
endif
" }}}

" vim: fdm=marker:sw=2:sts=2:et
