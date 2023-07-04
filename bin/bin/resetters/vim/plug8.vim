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
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>g :CtrlPUndo<CR>
nnoremap <leader>h :CtrlPMRUFiles<CR>
nnoremap <leader>j :CtrlPChangeAll<CR>
nnoremap <leader>k :CtrlPBufTagAll<CR>
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <leader><Tab> :CtrlPBuffer<CR>
" }}}




" ALE CONFIG {{{
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
" ---
nnoremap <silent><C-n> :ALENext<CR>
nnoremap <silent><C-p> :ALEPrevious<CR>
nnoremap <leader>a :ALESymbolSearch<Space>
nnoremap <leader>s :ALEFindReferences<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
" }}}
