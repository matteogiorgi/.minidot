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
    set completeopt=menu,menuone,popup,noselect,noinsert
    " ---
    augroup ale_ominfunc
        autocmd FileType python setlocal omnifunc=ale#completion#OmniFunc
    augroup END
    " ---
    let g:ale_linters = {'python': ['pylsp', 'flake8']}
    let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'black']}
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_virtualtext_cursor = 0
    let g:ale_fix_on_save = 1
    let g:ale_lsp_suggestions = 1
    " ---
    inoremap <silent><C-c> :AleComplete<CR>
    nnoremap <silent><C-n> :ALENextWrap<CR>
    nnoremap <silent><C-p> :ALEPreviousWrap<CR>
    nnoremap <leader>a :ALEPopulateQuickfix<CR>
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
                \      'dir': '\v[\/]\.(git|hg|svn|mypy_cache)$',
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
    function! s:CopilotPanel()
        let l:panel_status = len(filter(range(1, bufnr('$')), 
                    \ 'bufexists(v:val) && bufname(v:val) =~# "^copilot:///"')) > 0
        let g:copilot_panel = l:panel_status ? 'close' : 'Copilot panel'
        silent! execute g:copilot_panel
    endfunction
    " ---
    let g:copilot_enabled = v:true
    nnoremap <localleader>c :call <SID>CopilotPanel()<CR>
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
