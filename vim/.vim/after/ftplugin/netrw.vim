" This vimscript file containers all the Netrw
" buffer specific keyboard mappings.

" NETRW BUFFERS ARE WIPED FROM THE
" BUFFER LIST, EVEN IF 'HIDDEN' IS SET
" ---
" h  ->  upadir
" l  ->  opendir
" .  ->  (un)hide
" ---
" <  ->  (de)select
" >  ->  deselectall
" ---
" d  ->  newdir
" f  ->  newfile (buffer)
" R  ->  rename
" D  ->  delete
" c  ->  copy
" m  ->  move
" x  ->  execute


setlocal bufhidden=wipe
" ---
nmap <buffer> h -<esc>
nmap <buffer> l <cr>
nmap <buffer> . gh
" ---
nmap <buffer> < mf
nmap <buffer> > mu
" ---
nmap <buffer> d d
nmap <buffer> f %:w<CR>:buffer #<CR>
nmap <buffer> R R
nmap <buffer> D D
nmap <buffer> c mtmc
nmap <buffer> m mtmm
nmap <buffer> x mx
