"  ____  _
" |  _ \| |_   _  __ _ _ __ ___   ___
" | |_) | | | | |/ _` | '_ ` _ \ / _ \
" |  __/| | |_| | (_| | | | | | |  __/
" |_|   |_|\__,_|\__, |_| |_| |_|\___|
"                |___/
"
" Simple viml-script that sets a basic
" configuration for all the plugins, let's go!




" VIM8 CONFIG {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
nnoremap <localleader>k :!ctags -R --exclude=.git<CR>
" }}}




" CTRLP CONFIG {{{
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
nnoremap <leader>a :CtrlPMixed<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>h :CtrlPMRUFiles<CR>
nnoremap <leader>H :CtrlPUndo<CR>
nnoremap <leader>j :CtrlPChange<CR>
nnoremap <leader>J :CtrlPChangeAll<CR>
nnoremap <leader>k :CtrlPBufTag<CR>
nnoremap <leader>K :CtrlPBufTagAll<CR>
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <silent><Tab> :CtrlPBuffer<CR>
" }}}




" FUGITIVE CONFIG {{{
nnoremap <leader>g :Git blame<CR>
nnoremap <leader>G :Gvdiffsplit<CR>
" }}}




" ALE CONFIG {{{
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
" ---
nnoremap <silent><C-n> :ALENext<CR>
nnoremap <silent><C-p> :ALEPrevious<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>s :ALEFindReferences<CR>
nnoremap <leader>S :ALESymbolSearch<Space>
" }}}




" VIM9 CONFIG {{{
if v:version >= 900
    set wildoptions=fuzzy,pum,tagfile
    " ---
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
endif
" }}}
