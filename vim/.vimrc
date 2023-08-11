" __     ___
" \ \   / (_)_ __ ___
"  \ \ / /| | '_ ` _ \
"   \ V / | | | | | | |
"    \_/  |_|_| |_| |_|
"
" Vim editor - https://www.vim.org




" Checks {{{
if has('linebreak')
    let &showbreak='⤷ '
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




" Syntax & colors {{{
syntax on
filetype plugin indent on
" ---
if filereadable(expand('~/.vim/colors/noctu.vim'))
    colorscheme noctu
endif
" }}}




" Leaders & caret {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"
" ---
" [1] blink-block     [3] blink-underline     [5] blink-bar
" [2] steady-block    [4] steady-underline    [6] steady-bar
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
set cursorline noerrorbells novisualbell
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
set fillchars+=vert:\┃
set laststatus=2
set showtabline=1
set nocompatible
set esckeys
" ---
set path+=**
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,noinsert,noselect
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
    set wildoptions=fuzzy,pum,tagfile
endif
" }}}




" Prettyfiers {{{
augroup linenumber_prettyfier
    autocmd!
    autocmd WinEnter,BufEnter,FocusGained,InsertLeave *
                \ if &number == 1|
                \     set relativenumber|
                \ endif|
                \ set cursorline
    autocmd WinLeave,BufLeave,FocusLost,InsertEnter *
                \ if &number == 1|
                \     set norelativenumber|
                \ endif|
                \ set nocursorline
augroup end
" ---
augroup cursorcolumn_prettyfier
    autocmd!
    autocmd InsertEnter *
                \ if &filetype != 'text' && &filetype != 'markdown' && &filetype != 'tex'|
                \     let &colorcolumn = '121,'.join(range(121,999),',')|
                \ endif
    autocmd InsertLeave *
                \ if &filetype != 'text' && &filetype != 'markdown' && &filetype != 'tex'|
                \     set colorcolumn=|
                \ endif
augroup end
" ---
augroup netrw_prettyfier
    autocmd!
    autocmd VimEnter *
                \ if !argc() && exists(':Explore')|
                \     Explore|
                \ endif
    " [h] upadir      [<] (de)select     [f] newfile    [c] copy
    " [l] opendir     [>] deselectall    [R] rename     [m] move
    " [.] (un)hide    [d] newdir         [D] delete     [x] execute
    autocmd FileType netrw
                \ setlocal bufhidden=wipe|
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
    let g:netrw_keepdir = 0
    let g:netrw_liststyle = 4
    let g:netrw_sort_options = 'i'
    let g:netrw_sort_sequence = '[\/]$,*'
    let g:netrw_browsex_viewer = 'xdg-open'
    let g:ghregex = '\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_list_hide = g:ghregex
    let g:netrw_preview = 0
    let g:netrw_alto = 1
    let g:netrw_altv = 0
augroup end
" }}}




" Commands {{{
command! ToggleHemisu
            \ if colors_name ==# 'hemisu'|
            \     if &background ==# 'light'|
            \         set background=dark|
            \     else|
            \         set background=light|
            \     endif|
            \ else|
            \     echo 'hemisu not set'|
            \ endif
" ---
command! ToggleWrap
            \ if &wrap|
            \     setlocal nowrap|
            \     nunmap <buffer> j|
            \     nunmap <buffer> k|
            \     echo 'set nowrap'|
            \ else|
            \     setlocal wrap|
            \     nmap <buffer> j gj|
            \     nmap <buffer> k gk|
            \     echo 'set wrap'|
            \ endif
" ---
command! ClearSearch
            \ execute 'let @/=""'|
            \ echo 'cleared last search'
" ---
command! RemoveSpaces
            \ let v:statusmsg = ""|
            \ execute 'silent verbose %s/\s\+$//e'|
            \ echo !empty(v:statusmsg) ? v:statusmsg : 'removed trailing spaces'
" }}}




" Keymaps {{{
nnoremap <localleader>h :ToggleHemisu<CR>
nnoremap <localleader>w :ToggleWrap<CR>
nnoremap <localleader>c :ClearSearch<CR>
nnoremap <localleader>r :RemoveSpaces<CR>
" ---
tnoremap <silent><C-q> <C-\><C-n>
nnoremap <leader>w <C-w>
" ---
vnoremap <silent>H <gv
vnoremap <silent>L >gv
xnoremap <silent>J :move '>+1<CR>gv=gv
xnoremap <silent>K :move '<-2<CR>gv=gv
nnoremap <silent>Y y$
" ---
map <silent><C-h> (
map <silent><C-l> )
map <silent><C-j> }
map <silent><C-k> {
" ---
nnoremap <silent><CR> :tabnew %<CR>
nnoremap <silent><BS> :tabclose<CR>
nnoremap <silent><C-n> :tabnext<CR>
nnoremap <silent><C-p> :tabprev<CR>
" ---
nnoremap <silent><Tab> :buffer#<CR>
nnoremap <leader><Tab> :buffers<CR>:buffer<Space>
" ---
nnoremap <leader><leader> :Explore<CR>
vnoremap <leader><leader> :!<Space>
xnoremap <localleader><localleader> :s///gc<Left><Left><Left>
" ---
nnoremap <leader>0 0gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
" }}}




" Gui setup {{{
if has('gui_running')
    set guifont=Fira\ Code\ 8.5
    set guioptions=i
    set guicursor+=a:blinkon0
    " ---
    set columns=140 lines=60
    set vb t_vb=
    " ---
    if filereadable(expand('~/.vim/colors/hemisu.vim'))
        set background=dark
        colorscheme hemisu
    endif
endif
" }}}
