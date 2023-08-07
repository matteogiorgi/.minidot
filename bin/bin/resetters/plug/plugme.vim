"  ____  _
" |  _ \| |_   _  __ _ _ __ ___   ___
" | |_) | | | | |/ _` | '_ ` _ \ / _ \
" |  __/| | |_| | (_| | | | | | |  __/
" |_|   |_|\__,_|\__, |_| |_| |_|\___|
"                |___/
"
" Simple viml-script that sets a basic
" configuration for all the plugins, let's go!
"
" Vim 9.0+ required




" VIM CONFIG {{{
if v:version >= 900
    set wildoptions=fuzzy,pum,tagfile
endif
" ---
function s:Ctags()
    if executable('ctags')
        execute 'silent !ctags -R --exclude=.git'
        redraw!
        redrawstatus!
        redrawtabline
    endif
endfunction
" ---
nnoremap <localleader>k :call <SID>Ctags()<CR>
" }}}




" CTRLP CONFIG {{{
if &rtp =~ 'ctrlp'
    let g:ctrlp_map = ''
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_user_command = [
                \      '.git',
                \      'cd %s && git ls-files -co --exclude-standard'
                \ ]
    let g:ctrlp_custom_ignore = {
                \      'dir':  '\v[\/]\.(git|hg|svn)$',
                \      'file': '\v\.(exe|so|dll)$'
                \ }
    " ---
    nnoremap <leader>f :CtrlP<CR>
    nnoremap <leader>F :CtrlPMixed<CR>
    nnoremap <leader>h :CtrlPMRUFiles<CR>
    nnoremap <leader>H :CtrlPUndo<CR>
    nnoremap <leader>j :CtrlPChange<CR>
    nnoremap <leader>J :CtrlPChangeAll<CR>
    nnoremap <leader>k :CtrlPBufTag<CR>
    nnoremap <leader>K :CtrlPBufTagAll<CR>
    nnoremap <leader>l :CtrlPLine %<CR>
    nnoremap <leader>L :CtrlPLine<CR>
    nnoremap <leader><Tab> :CtrlPBuffer<CR>
endif
" }}}




" FUGITIVE CONFIG {{{
if &rtp =~ 'fugitive'
    function! s:GitCheck()
        return bufname('%') !~ '^fugitive://' &&
                    \ executable('git') &&
                    \ systemlist('git rev-parse --is-inside-work-tree')[0] == 'true'
    endfunction
    " ---
    function! s:GitLog(arg)
        if <SID>GitCheck()
            execute 'Git log --graph --format="%h%d %s %cr"' . a:arg
            execute 'wincmd T'
        else
            echo "not a git repo"
        endif
    endfunction
    " ---
    function! s:GitDiff(arg)
        if <SID>GitCheck()
            if a:arg == ''
                execute 'Git diff HEAD'
                execute 'wincmd T'
            else
                execute 'tabnew %'
                execute 'Gvdiffsplit HEAD'
            endif
        else
            echo "not a git repo"
        endif
    endfunction
    " ---
    nnoremap <leader>g :call <SID>GitDiff('%')<CR>
    nnoremap <leader>G :call <SID>GitDiff('')<CR>
    nnoremap <localleader>g :call <SID>GitLog('%')<CR>
    nnoremap <localleader>G :call <SID>GitLog('')<CR>
endif
" }}}




" ALE CONFIG {{{
if &rtp =~ 'ale'
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc
    " ---
    inoremap <silent><C-c> :AleComplete<CR>
    nnoremap <silent>E :ALENext<CR>
    nnoremap <silent>B :ALEPrevious<CR>
    nnoremap <leader>d :ALEGoToDefinition<CR>
    nnoremap <leader>D :ALEGoToTypeDefinition<CR>
    nnoremap <leader>s :ALEFindReferences<CR>
    nnoremap <leader>S :ALESymbolSearch<Space>
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
    function! s:ToggleCopilot()
        if g:copilot_enabled
            let g:copilot_enabled = v:false
            echo "Copilot disabled"
        else
            let g:copilot_enabled = v:true
            echo "Copilot enabled"
        endif
    endfunction
    " ---
    let g:copilot_enabled = v:false
    nnoremap <leader>a :Copilot panel<CR>
    nnoremap <leader>A :call <SID>ToggleCopilot()<CR>
    " ---
    inoremap <silent><C-s> <Plug>(copilot-suggest)
    inoremap <silent><C-d> <Plug>(copilot-dismiss)
    inoremap <silent><C-h> <C-w>
    inoremap <silent><C-j> <Plug>(copilot-next)
    inoremap <silent><C-k> <Plug>(copilot-previous)
    inoremap <script><expr> <C-l> <SID>SuggestWord()
endif
" }}}
