" __     ___
" \ \   / (_)_ __ ___
"  \ \ / /| | '_ ` _ \
"   \ V / | | | | | | |
"    \_/  |_|_| |_| |_|
"
" Vim editor - https://www.vim.org




" Checks {{{
if has('linebreak')
    let &showbreak='  ~'
endif
" ---
if has('persistent_undo')
    if !isdirectory(expand('~/.vim/undodir'))
        execute "!mkdir -p ~/.vim/undodir &>/dev/null"
    endif
    set undodir=$HOME/.vim/undodir
    set undofile
endif
" }}}




" Leaders & caret {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"
" ---
" [1] blink-block        [4] steady-underline
" [2] steady-block       [5] blink-bar
" [3] blink-underline    [6] steady-bar
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" ---
if has('python3')
    let g:python3_host_prog = '/usr/bin/python3'
endif
" }}}




" Set options {{{
set exrc
set title
set shell=bash
set runtimepath+=~/.vim_runtime
set clipboard=unnamedplus
set number relativenumber mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set ruler scrolloff=8 sidescrolloff=16
set autoindent
set formatoptions+=l
set hlsearch incsearch
set nowrap nospell
set ignorecase smartcase smartindent
set noswapfile nobackup
set showmode showcmd
set nocursorline noerrorbells novisualbell
set cursorlineopt=number,line
set splitbelow splitright
set equalalways
set nofoldenable foldmethod=marker
set matchpairs+=<:>
set autochdir
set hidden
set updatetime=100
set timeoutlen=2000
set ttimeoutlen=0
set termencoding=utf-8 encoding=utf-8 | scriptencoding utf-8
set sessionoptions=blank,buffers,curdir,folds,tabpages,help,options,winsize
set colorcolumn=
set cmdheight=1
set nrformats-=alpha
set fillchars=vert:┃,fold:━
set laststatus=2
set showtabline=1
set nocompatible
set esckeys
" ---
set path+=**
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview,noinsert,noselect
set complete=.,w,b,u,t,i,kspell
set complete+=k/usr/share/dict/american-english
set complete+=k/usr/share/dict/italian
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/italian
set wildmenu
set wildchar=<Tab> wildmode=full
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip
set shortmess+=c
set belloff+=ctrlg
" ---
if v:version >= 900
    set fillchars+=eob:╺
    set wildoptions=fuzzy,pum,tagfile
endif
" ---
if has('gui_running')
    set guioptions=i
    set guicursor+=a:blinkon0
    set columns=140 lines=60
    set vb t_vb=
    " ---
    if system('fc-list') =~ 'Fira Code'
        set guifont=Fira\ Code\ 8
    endif
    " ---
    command! GuiFont silent! execute 'set guifont=*'
endif
" }}}




" Syntax & colors {{{
syntax on
filetype plugin indent on
" }}}




" Prettyfiers {{{
augroup netrw_prettyfier
    autocmd!
    autocmd VimEnter *
                \ if !argc() && exists(':Explore')|
                \     Explore|
                \ endif
    " ---
    " [h] upadir      [<] (de)select     [f] newfile    [c] copy
    " [l] opendir     [>] deselectall    [R] rename     [m] move
    " [.] (un)hide    [d] newdir         [D] delete     [x] execute
    autocmd FileType netrw
                \ setlocal nocursorline|
                \ setlocal bufhidden=wipe|
                \ nmap <buffer> i <Nop>|
                \ nmap <buffer> h -<esc>|
                \ nmap <buffer> l <cr>|
                \ nmap <buffer> . gh|
                \ nmap <buffer> < mf|
                \ nmap <buffer> > mu|
                \ nmap <buffer> d d|
                \ nmap <buffer> f %:w<CR>:buffer #<CR>|
                \ nmap <buffer> R R|
                \ nmap <buffer> D D|
                \ nmap <buffer> c mtmc|
                \ nmap <buffer> m mtmm|
                \ nmap <buffer> x mx
    let g:netrw_banner = 0
    let g:netrw_liststyle = 4
    let g:netrw_sort_options = 'i'
    let g:netrw_sort_sequence = '[\/]$,*'
    let g:netrw_browsex_viewer = 'xdg-open'
    let g:netrw_list_hide = '^\./$'
    let g:netrw_hide = 1
    let g:netrw_preview = 0
    let g:netrw_alto = 1
    let g:netrw_altv = 0
augroup end
" ---
augroup linenumber_prettyfier
    autocmd!
    autocmd WinEnter,BufEnter,FocusGained,InsertLeave *
                \ if &number == 1|
                \     set relativenumber|
                \ endif
    autocmd WinLeave,BufLeave,FocusLost,InsertEnter *
                \ if &number == 1|
                \     set norelativenumber|
                \ endif
augroup end
" }}}




" Functions {{{
function! s:ToggleQF()
    let g:loclist = 'lclose'
    let g:quickfix = !exists("g:quickfix") || g:quickfix ==# 'cclose' ? 'copen' : 'cclose'
    silent! execute g:loclist
    silent! execute g:quickfix
endfunction
" ---
function! s:MarkLineQF()
    let l:qf_list = getqflist()
    let l:qf_entry = {
        \ 'bufnr': bufnr("%"),
        \ 'lnum': line("."),
        \ 'col': col("."),
        \ 'text': getline("."),
        \ 'filename': expand("%:p"),
    \ }
    call add(l:qf_list, l:qf_entry)
    call setqflist(l:qf_list)
    echo 'current line to quickfix'
endfunction
" ---
function! s:ResetQF()
    call setqflist([])
    echo 'reset quickfix'
endfunction
" }}}




" Commands {{{
command! ClearSearch
            \ silent! execute 'let @/=""'|
            \ echo 'cleared last search'
" ---
command! RemoveSpaces
            \ silent! execute 'let v:statusmsg = "" | verbose %s/\s\+$//e'|
            \ echo !empty(v:statusmsg) ? v:statusmsg : 'removed trailing spaces'
" ---
command! WrapToggle
            \ silent! execute &wrap ? 'setlocal nowrap' : 'setlocal wrap'|
            \ silent! execute &wrap ?'noremap <buffer> j gj|noremap <buffer> k gk' : 'unmap <buffer> j|unmap <buffer> k'|
            \ echo &wrap ? 'lines wrapped' : 'lines unwrapped'
" ---
command! NumbersToggle
            \ silent! execute &rnu ? 'setlocal nonu nornu' : &nu ? 'setlocal rnu' : 'setlocal nu'|
            \ echo &rnu ? 'relativenumbers' : &nu ? 'numbers' : 'no-numbers'
" ---
command! BackgroundToggle
            \ let colorscheme_name = get(g:, 'colors_name', '')|
            \ silent! execute &bg ==# 'light' ? 'set bg=dark' : 'set bg=light'|
            \ silent! execute "colorscheme " . colorscheme_name|
            \ redraw!|redrawstatus!|redrawtabline|
            \ echo colorscheme_name . ' ' . &background
" }}}




" Keymaps {{{
noremap <silent><C-h> (
noremap <silent><C-l> )
noremap <silent><C-j> }
noremap <silent><C-k> {
" ---
nnoremap <silent>Y y$
vnoremap <silent>H <gv
vnoremap <silent>L >gv
xnoremap <silent>J :move '>+1<CR>gv=gv
xnoremap <silent>K :move '<-2<CR>gv=gv
" ---
nnoremap <leader>j :buffers!<CR>:buffer<Space>
nnoremap <leader>k :buffer#<CR>
nnoremap <leader>o :tabnew %<CR>
nnoremap <leader>c :tabclose<CR>
" ---
nnoremap <leader>a :call <SID>ToggleQF()<CR>
nnoremap <leader>m :call <SID>MarkLineQF()<CR>
nnoremap <leader>r :call <SID>ResetQF()<CR>
" ---
nnoremap <leader>e :Explore<CR>
tnoremap <silent><C-x> <C-\><C-n>
" }}}

" vim: fdm=marker:sw=2:sts=2:et
