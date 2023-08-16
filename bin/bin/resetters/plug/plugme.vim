"  ____  _
" |  _ \| |_   _  __ _ _ __ ___   ___
" | |_) | | | | |/ _` | '_ ` _ \ / _ \
" |  __/| | |_| | (_| | | | | | |  __/
" |_|   |_|\__,_|\__, |_| |_| |_|\___|
"                |___/
"
" Simple viml-script that sets a basic
" configuration for all the plugins.
"
" Vim 9.0+ required




" CTAGS CONFIG {{{
function s:Ctags()
    if !executable('ctags')
        echo "ctags not installed"
        return
    endif
    " ---
    execute 'silent !ctags -R --exclude=.git'
    redraw!
    redrawstatus!
    redrawtabline
    echo "c-tagged"
endfunction
" ---
command! Ctags call <SID>Ctags()
" }}}




" FUGITIVE CONFIG {{{
if &rtp =~ 'fugitive'
    function! s:GitMe(arg)
        if !executable('git')
            echo "git not installed"
            return
        endif
        " ---
        if bufname('%') =~ '^fugitive://' || bufname('%') =~ '^copilot://'
                    \ || systemlist('git rev-parse --is-inside-work-tree')[0] != 'true'
            echo "not a git repo"
            return
        endif
        " ---
        if a:arg == 'diffsplit'
            execute 'tabnew %'
            execute 'Gdiffsplit'
        elseif a:arg == 'diff'
            execute 'Git diff'
            execute 'wincmd T'
        elseif a:arg == 'blame'
            execute 'Git blame'
            execute 'wincmd T'
        elseif a:arg == 'log'
            execute 'Git log --graph --format="%h%d %s %cr"'
            execute 'wincmd T'
        else
            echoerr "invalid argument"
        endif
    endfunction
    " ---
    augroup fugitive_maps
        autocmd!
        autocmd BufEnter fugitive://* nmap <buffer><expr> <silent><CR> ''
    augroup end
    " ---
    nnoremap <leader>gg :call <SID>GitMe('diffsplit')<CR>
    nnoremap <leader>gd :call <SID>GitMe('diff')<CR>
    nnoremap <leader>gb :call <SID>GitMe('blame')<CR>
    nnoremap <leader>gl :call <SID>GitMe('log')<CR>
endif
" }}}




" ALE CONFIG {{{
if &rtp =~ 'ale'
    function! s:ToggleALE()
        if g:ale_enabled
            execute 'ALEDisable'
            echo "ALE disabled"
        else
            execute 'ALEEnable'
            echo "ALE enabled"
        endif
    endfunction
    " ---
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc
    " ---
    inoremap <silent><C-c> :AleComplete<CR>
    nnoremap <silent>E :ALENext<CR>
    nnoremap <silent>B :ALEPrevious<CR>
    nnoremap <leader>aa :call <SID>ToggleALE()<CR>
    nnoremap <leader>as :ALEFindReferences<CR>
    nnoremap <leader>ad :ALEGoToDefinition<CR>
endif
" }}}




" FUZZYY CONFIG {{{
if &rtp =~ 'fuzzyy'
    let g:fuzzyy_menu_matched_hl = 'cursearch'
    let g:enable_fuzzyy_MRU_files = 1
    let g:enable_fuzzyy_keymaps = 0
    " ---
    nnoremap <silent> <leader>ff :FuzzyFiles<CR>
    nnoremap <silent> <leader>fg :FuzzyGrep<CR>
    nnoremap <silent> <leader>fh :FuzzyMRUFiles<CR>
    nnoremap <silent> <leader>fl :FuzzyInBuffer<CR>
    nnoremap <silent> <leader>fc :FuzzyCommands<CR>
    nnoremap <silent> <leader><Tab> :FuzzyBuffers<CR>
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
    let g:copilot_enabled = v:true
    nnoremap <leader>cc :call <SID>ToggleCopilot()<CR>
    nnoremap <leader>cs :Copilot panel<CR>
    " ---
    inoremap <silent><C-s> <Plug>(copilot-suggest)
    inoremap <silent><C-d> <Plug>(copilot-dismiss)
    inoremap <silent><C-h> <C-w>
    inoremap <silent><C-j> <Plug>(copilot-next)
    inoremap <silent><C-k> <Plug>(copilot-previous)
    inoremap <script><expr> <C-l> <SID>SuggestWord()
endif
" }}}
