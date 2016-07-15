" Colors {{{
set t_Co=256
set background=dark
color kolor
" }}}
" Misc {{{
execute pathogen#infect()
syntax on
filetype plugin on
" }}}
" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
" }}}
" UI Layout {{{
filetype indent on " load filetype-specific indent files
set number
set showcmd
set cmdheight=2
set cursorline  "highlight current line
set wildmenu
set lazyredraw
set showmatch  " highlight matching [{()}]
set hidden
set autochdir "Autoset current directory same as the edited file's directory
" status line
set laststatus=2          "status line always visible
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
" }}}
" Search {{{
set incsearch " search as characters are entered
set hlsearch
" }}}
" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" movement in split mode
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" }}}
" Personal Shortcut {{{
let mapleader = "," "Leader is comma
set pastetoggle=<leader>p
"" jk is escape
inoremap jk <esc>
inoremap <esc> <nop>
" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" wrap word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
"
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
"
nnoremap <leader>] viw<esc>a]<esc>hbi[<esc>lel
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>
"
nnoremap <leader>} viw<esc>a}<esc>hbi{<esc>lel
vnoremap <leader>} <esc>`<i{<esc>`>la}<esc>
"
nnoremap <leader>> viw<esc>a><esc>hbi<<esc>lel
vnoremap <leader>> <esc>`<i<<esc>`>la><esc>
" Delete line
inoremap <c-d> <esc> ddi
noremap <leader>d dd
" Swap line down
nnoremap - ddp
" Swap line up
nnoremap _ ddkP
" Convert current word to uppercase
nnoremap <c-u> viwU
inoremap <c-u> <esc>hviwUA
" switch to alternate file
noremap <c-\> :bnext<cr>
" off highlighted search
nnoremap <leader><space> :nohlsearch<CR>
" match trailing spaces and tabs
nnoremap <leader>w :match Cursor /\v[ \t]+$/<CR>
" clear match
nnoremap <leader>W :match none<CR>
" add magic \v when search
nnoremap / /\v
" toggle number
nnoremap <leader>N :setlocal number!<CR>
" toggle gundo
nnoremap <F5> :GundoToggle<CR>
" open NERDTree
nnoremap \nt :NERDTree<CR>
"" grep command
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 5 <cr>
" }}}
" AutoGroups {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Functions {{{
"  toggle foldcolumn
nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
"
" toggle quickfix window
nnoremap <leader>q :call <SID>QuickFixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickFixToggle()
    if g:quickfix_is_open
        cclose
        execute g:quickfix_return_to_window . "wincmd w"
        let g:quickfix_is_open = 0
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}
