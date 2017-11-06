colorscheme desert

if has('win32')
	set nocompatible
	source $VIMRUNTIME/vimrc_example.vim
	"source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function MyDiff()
	  let opt = '-a --binary '
	  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	  let arg1 = v:fname_in
	  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	  let arg2 = v:fname_new
	  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	  let arg3 = v:fname_out
	  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	  let eq = ''
	  if $VIMRUNTIME =~ ' '
	    if &sh =~ '\<cmd'
	      let cmd = '""' . $VIMRUNTIME . '\diff"'
	      let eq = '"'
	    else
	      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	    endif
	  else
	    let cmd = $VIMRUNTIME . '\diff'
	  endif
	  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif


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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map semicolon to colon
nnoremap ; :

" Map <tab> to %
nnoremap <TAB> %

" Delete current file and close buffer
"nnoremap <leader>rm delete(expand('%')) | bdelete!<CR>

""""""""""""""""""""""""""""""""""""""""
" Useful Settings
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax colouring
syntax on
set encoding=utf-8

" Useful for finding whitespace issues
" 	Enable using ' :set list '
:set listchars=eol:$,tab:>>,trail:~,extends:>,precedes:<

" Fix 'path' option - useful for 'tabfind'
set path=.,,**

" Highlight search results
set hlsearch

""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""

set ai " Auto indent
set wrap " Wrap lines

" Use spaces instead of tabs
set expandtab

" Smart use of tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

set softtabstop=4

" Show matching brackets when text indicator is over them
set showmatch

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Sets how many lines of history VIM has to remember
set history=700

" Set auto-indent on
" filetype plugin on
" filetype indent on
filetype plugin indent on

" Turn on the WiLd menu
set wildmenu
set wildchar=<Tab> wildmode=full

" Don't redraw while executing macros (performance?)
set lazyredraw

" Linebreak on 500 characters
"set lbr
"set tw=500
set tw=0

" Linebreak and wrap
set linebreak
set nolist

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
map <leader>p :tabfind<space>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Moves forward one page
nnoremap <leader>j <C-f>

" Moves backward one page
nnoremap <leader>k <C-b>

" Fix spelling
"nnoremap <leader>f 1z=

" Toggle spelling visuals
nnoremap <leader>s :set spell!

" Perform a grep
nnoremap <leader>g :! grep -rs --color=always 

" Source vimrc file
nnoremap <leader>sv :source ~/.vimrc<cr>

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
"nmap <leader>f :e <c-r>=expand("%:p:h")<cr>/

" NERD Tree plugin
nmap <leader>f :NERDTree<cr>

" Move to the next buffer
nmap <leader>l :bnext<cr>

" Move to the previous buffer
nmap <leader>h :bprevious<cr>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<cr>

" Show all open buffers and their status
nmap <leader>ss :ls<cr>

" Switch to specific buffer (see which buffers are open using above)
nmap <leader>sb :b

" Split window verticaly
nmap <leader>v <C-W><C-v>

" Split window horizontally
nmap <leader>b :split<cr>

nmap <leader><TAB> <C-6>

" Turn off auto adding comments on next line
set fo=tcq

set t_Co=256

set ruler

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Pathogen
execute pathogen#infect()
