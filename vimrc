" Wraps long lines of code
set wrap

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Map 'jk' to the escape character
inoremap jk <ESC>

" Change the leader key to the space bar
let mapleader = "\<Space>"

" Turn on syntax colouring
syntax on
set encoding=utf-8

" Fix spelling
nnoremap <leader>f 1z=

" Toggle spelling visuals
nnoremap <leader>s :set spell!

" Toggle line-numbers
nnoremap <leader>n :set nu!<return>

" Toggle case (in-)sensitive search
nnoremap <leader>i :set ic!<return>

" Fast saving
nnoremap <leader>w :w!<return>

" Turn on the WiLd menu
set wildmenu

" Highlight search results
set hlsearch

" Don't redraw while executing macros (performance?)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" Use spaces instead of tabs
set expandtab

" Smart use of tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Visual mode pressing * or # searches for current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines
map j gj
map k gk

" Smart way to move between windows
map <C-f> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remove the Windows ^M - when the encodings get messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
