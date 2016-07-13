" Colors {{{
set t_Co=256
set background=dark
color kolor
" }}}
" Misc {{{
filetype plugin on
syntax enable
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
" jk is escape 
inoremap jk <esc>
vnoremap jk <esc>
inoremap <esc> <nop>
" edit vimrc/zshrc and load vimrc bindings
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
noremap dL d$
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
" clear match
nnoremap <leader>W :match none<CR>
" add magic \v when search
nnoremap / /\v
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
