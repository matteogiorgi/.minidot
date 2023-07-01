"      _
"     | |_   _ _ __ ___  _ __   ___ _ __
"  _  | | | | | '_ ` _ \| '_ \ / _ \ '__|
" | |_| | |_| | | | | | | |_) |  __/ |
"  \___/ \__,_|_| |_| |_| .__/ \___|_|
"                       |_|
"
" Simple utility plugin containings functions
" that quickly jump directories & windows within Vim.




" Check {{{
if exists("g:jumper")
    finish
endif
" ---
let g:jumper = 1
"}}}




" Jump to current directory {{{
function! s:JumpCurrentDir()
    echon 'CWD: '
    cd %:p:h
    echon getcwd()
endfunction
"}}}


" Jump to parent directory {{{
function! s:JumpParentDir()
    if getcwd() ==? $HOME
        echon 'No more jumping -- CWD: ' . getcwd()
        return
    endif

    echon 'CWD: '
    let l:parent = fnamemodify('getcwd()', ':p:h:h')
    execute 'cd ' . l:parent
    echon getcwd()
endfunction
"}}}


" Jump to git directory {{{
function! s:JumpGitDir()
    if getcwd() ==? $HOME
        echon 'Not in git repository -- CWD: ' . getcwd()
        return
    endif

    if isdirectory('.git')
        echon 'CWD: ' . getcwd()
        return
    else
        let l:parent = fnamemodify('getcwd()', ':p:h:h')
        execute 'cd ' . l:parent
        execute 'call s:JumpGitDir()'
    endif
endfunction
"}}}


" Jump to neighbor window {{{
function! s:JumpWindow(key)
    let t:curwin = winnr()
    exec 'wincmd '.a:key
    if t:curwin ==? winnr()
        if match(a:key,'[jk]')
            wincmd v
        else
            wincmd s
        endif
        exec 'wincmd '.a:key
    endif
    return bufname('%')
endfunction
"}}}




" Commands & Keymaps {{{
command! JumpCurrentDir call <SID>JumpCurrentDir()
command! JumpParentDir call <SID>JumpParentDir()
command! JumpGitDir call <SID>JumpGitDir()
" ---
nnoremap <silent><CR> :JumpCurrentDir<CR>
nnoremap <silent><Backspace> :JumpParentDir<CR>
nnoremap <leader><Backspace> :JumpGitDir<CR>
" ---
tnoremap <silent><C-q> <C-\><C-n>
nnoremap <leader>w <C-w>
" ---
nnoremap <leader>wh :call <SID>JumpWindow("h")<CR>
nnoremap <leader>wj :call <SID>JumpWindow("j")<CR>
nnoremap <leader>wk :call <SID>JumpWindow("k")<CR>
nnoremap <leader>wl :call <SID>JumpWindow("l")<CR>
"}}}
