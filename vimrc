""""""""""""""""""""""""""""""""""""""""
" Basic Functionality
""""""""""""""""""""""""""""""""""""""""

" Map 'jk' to the escape character
inoremap jk <ESC>

" Change the leader key to the space bar
let mapleader = "\<Space>"

" Treat long lines as break lines
map j gj
map k gk

" Smart way to move between windows
map <C-f> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map semicolon to colon
nnoremap ; :

""""""""""""""""""""""""""""""""""""""""
" Useful Settings
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax colouring
syntax on
set encoding=utf-8

" Fix 'path' option - useful for 'tabfind'
set path=.,,**

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" Highlight search results
set hlsearch

" Use spaces instead of tabs
set expandtab

" Smart use of tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show matching brackets when text indicator is over them
set showmatch

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Sets how many lines of history VIM has to remember
set history=700

" Set auto-indent on
filetype plugin on
filetype indent on

" Turn on the WiLd menu
set wildmenu
set wildchar=<Tab> wildmenu wildmode=full

" Don't redraw while executing macros (performance?)
set lazyredraw

" Linebreak on 500 characters
set lbr
set tw=500

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

""""""""""""""""""""""""""""""""""""""""
" Advanced Functionality
""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for current selection
"   -> Need to add 'VisualSelection'?
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""""
" Leader Shortcuts
""""""""""""""""""""""""""""""""""""""""

" Fast saving
nnoremap <leader>w :w!<return>

" Toggle line-numbers
nnoremap <leader>n :set nu!<return>

" Toggle case (in-)sensitive search
nnoremap <leader>i :set ic!<return>

" Useful mappings for managing tabs
"   -> Removed for conflict with buffer behaviour
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>tf :tabfind

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Fix spelling
nnoremap <leader>f 1z=

" Toggle spelling visuals
nnoremap <leader>s :set spell!

" Remove the Windows ^M - when the encodings get messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

""""""""""""""""""""""""""""""""""""""""
" Buffer behaviour settings
""""""""""""""""""""""""""""""""""""""""

" This allows buffers to be hidden if I've modified a buffer.
set hidden

" To open a new empty buffer
nmap <leader>tn :enew<cr>

" Open file based on current directory
nmap <leader>f :e <c-r>=expand("%:p:h")<cr>/

" Move to the next buffer
nmap <leader>l :bnext<cr>

" Move to the previous buffer
nmap <leader>h :bprevious<rc>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<cr>

" Show all open buffers and their status
nmap <leader>ls :ls<cr>
