"  ____  _
" |  _ \| |_   _  __ _ _ __ ___   ___
" | |_) | | | | |/ _` | '_ ` _ \ / _ \
" |  __/| | |_| | (_| | | | | | |  __/
" |_|   |_|\__,_|\__, |_| |_| |_|\___|
"                |___/
"
" Simple viml-script that sets basic
" configuration for installed plugins.
" Vim 9.0+ required




" FUGITIVE CONFIG {{{
if &rtp =~ 'fugitive'
    augroup fugitive_maps
        autocmd!
        autocmd BufEnter fugitive://* nmap <buffer><expr> <silent><CR> ''
    augroup end
endif
" }}}




" UNDOTREE CONFIG {{{
if &rtp =~ 'undotree'
    let g:undotree_WindowLayout = 2
    let g:undotree_SplitWidth = 40
    let g:undotree_DiffpanelHeight = 15
    let g:undotree_ShortIndicators = 1
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_RelativeTimestamp = 0
    let g:undotree_HelpLine = 0
    " ---
    nnoremap <localleader>u :UndotreeToggle<CR>
endif
" }}}




" TAGBAR CONFIG {{{
if &rtp =~ 'tagbar'
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1
    " ---
    command! Ctags execute 'silent !ctags -R --exclude=.git'
    nnoremap <localleader>t :TagbarToggle<CR>
endif
" }}}




" ALE CONFIG {{{
if &rtp =~ 'ale'
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc
    " ---
    inoremap <silent><C-c> :AleComplete<CR>
    nnoremap <silent>W :ALENext<CR>
    nnoremap <silent>B :ALEPrevious<CR>
    nnoremap <leader>s :ALEFindReferences<CR>
    nnoremap <leader>d :ALEGoToDefinition<CR>
endif
" }}}




" CTRLP CONFIG {{{
if &rtp =~ 'ctrlp'
    let g:ctrlp_map = ''
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_custom_ignore = {
                \      'dir':  '\v[\/]\.(git|hg|svn)$',
                \      'file': '\v\.(exe|so|dll)$'
                \ }
    " ---
    nnoremap <leader>f :CtrlP<CR>
    nnoremap <leader>g :CtrlPMixed<CR>
    nnoremap <leader>h :CtrlPMRUFiles<CR>
    nnoremap <leader>j :CtrlPBuffer<CR>
    nnoremap <leader>k :CtrlPChange<CR>
    nnoremap <leader>l :CtrlPLine<CR>
endif
" }}}




" FUZZYY CONFIG {{{
if &rtp =~ 'fuzzyy'
    let g:fuzzyy_menu_matched_hl = 'cursearch'
    let g:enable_fuzzyy_MRU_files = 1
    let g:enable_fuzzyy_keymaps = 0
    " ---
    nnoremap <silent><leader>f :FuzzyFiles<CR>
    nnoremap <silent><leader>g :FuzzyGrep<CR>
    nnoremap <silent><leader>h :FuzzyMRUFiles<CR>
    nnoremap <silent><leader>j :FuzzyBuffers<CR>
    nnoremap <silent><leader>k :FuzzyCommands<CR>
    nnoremap <silent><leader>l :FuzzyInBuffer<CR>
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
