" ______________________________________________________________________
" | Table of Contents:                                                  |
" |   1. Environment                              |     <envmnt>        |
" |       1. Macro buffers                        |         <env_buff>  |
" |       2. VIM commands                         |         <env_cmd>   |
" |       3. Coloring, syntax and search          |         <env_col>   |
" |       4. Line numbering                       |         <env_lin>   |
" |       5. Metadata banner                      |         <env_meta>  |
" |       6. Navigation                           |         <env_nav>   |
" |       7. OS-specific                          |         <env_os>    |
" |       8. Whitespace, tabs and linebreaks      |         <env_tab>   |
" |       9. Auto-completion and wildmenu         |         <env_wild>  |
" |                                               |                     |
" |   2. Key-Bindings                             |     <key_bind>      |
" |       1. Insert Mode                          |         <bind_ins>  |
" |       2. Normal Mode                          |         <bind_norm> |
" |                                               |                     |
" |   3. Filetype / extension specific            |     <f_ext>         |
" |       1. Java                                 |         <f_java>    |
" |       2. Ruby                                 |         <f_ruby>    |
" |       3. SCSS                                 |         <f_scss>    |
" |       4. TypeScript                           |         <f_tysc>    |
" |       5. YAML                                 |         <f_yaml>    |
" |                                               |                     |
" |   4. Plugins                                  |     <plug>          |
" |       1. Pathogen                             |         <plug_path> |
" |                                               |                     |
" |   5. Archived                                 |     <archive>       |
" |_____________________________________________________________________|


"####################################################################################################
"####################################################################################################
"####   1. Environment      <envmnt>    #############################################################
"####################################################################################################
"####################################################################################################

"####################################################################################################
"########   1.1 Environment - Macro Buffers      <env_buff>    ######################################
"####################################################################################################

" Don't redraw while executing macros (performance?)
set lazyredraw

" This allows buffers to be hidden if I've modified a buffer.
set hidden

let @a=''
let @b=''
let @c=''
let @d=''
let @e=''
let @f=''
let @g=''
let @h=''
let @i=''
let @j=''
let @k=''
let @l=''
let @m=''
let @n=''
let @o=''
let @p=''
let @q=''
let @r=''
let @s=''
let @t=''
let @u=''
let @v=''
let @w=''
let @x=''
let @y=''
let @z=''

"####################################################################################################
"########   1.2 Environment - VIM Commands      <env_cmd>    ########################################
"####################################################################################################

" Fix 'path' option - useful for 'tabfind'
set path=.,,**

" Sets how many lines of history VIM has to remember
set history=700

"####################################################################################################
"########   1.3 Environment - Colouring, syntax and search      <env_col>    ########################
"####################################################################################################

colorscheme desert
set t_Co=256

" Turn on syntax colouring
syntax on
set encoding=utf-8

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

"####################################################################################################
"########   1.4 Environment - Line Numbering      <env_lin>    ######################################
"####################################################################################################

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Hybrid line numbers
set number relativenumber

augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber number
   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber nonumber
augroup END

"####################################################################################################
"########   1.5 Environment - Metadata Banner      <env_meta>    ####################################
"####################################################################################################

set ruler
set laststatus=2
set statusline=
set statusline+=%#StatusLine#
set statusline+=\[%{getcwd()}\]
set statusline+=%#ErrorMsg#
set statusline+=\ %f
set statusline+=\ %#StatusLine#

"####################################################################################################
"########   1.6 Environment - Navigation      <env_nav>    ##########################################
"####################################################################################################

" Treat long lines as break lines
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"####################################################################################################
"########   1.7 Environment - OS Specific      <env_os>    ##########################################
"####################################################################################################

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

"####################################################################################################
"########   1.8 Environment - Whitespace, Tabs, and Linebreaks      <env_tab>    ####################
"####################################################################################################

" Useful for finding whitespace issues
" 	Enable using ' :set list '
:set listchars=eol:$,tab:>>,trail:~,extends:>,precedes:<

" Auto indent
set autoindent

" Wrap lines
set wrap

" Use spaces instead of tabs
set expandtab

" Smart use of tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

" Set auto-indent on
filetype plugin indent on

" Linebreak and wrap
set linebreak
set nolist

"####################################################################################################
"########   1.9 Environment - Auto-Completion and WildMenu      <env_wild>    #######################
"####################################################################################################

" Turn on the WiLd menu
set wildmenu
set wildchar=<Tab> wildmode=full

"####################################################################################################
"####################################################################################################
"####   2. Key-Bindings      <key_bind>    ##########################################################
"####################################################################################################
"####################################################################################################

"####################################################################################################
"########   2.1 Key-Bindings - Insert Mode      <bind_ins>    #######################################
"####################################################################################################

" Map 'jk' to the escape character
inoremap jk <ESC>

" Fix backspace behavior
:set backspace=indent,eol,start

"####################################################################################################
"########   2.2 Key-Bindings - Normal Mode      <bind_norm>    ######################################
"####################################################################################################

" Change the leader key to the space bar
let mapleader = "\<Space>"

" Map semicolon to colon
nnoremap ; :

" Map <tab> to %
nnoremap <TAB> %

" Split window horizontally
nmap <leader>b :split<cr>

" NERD Tree plugin
nmap <leader>f :NERDTree<cr>

" Perform a grep
nnoremap <leader>g :! grep -rs --color=always 

" Move to the previous buffer
nmap <leader>h :bprevious<cr>

" Toggle case (in-)sensitive search
nnoremap <leader>i :set ic!<return>

" Moves forward one page
nnoremap <leader>j <C-f>

" Moves backward one page
nnoremap <leader>k <C-b>

" Move to the next buffer
nmap <leader>l :bnext<cr>

" Remove the Windows ^M - when the encodings get messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle line-numbers
nnoremap <leader>n :set nu! rnu!<return>

" Useful mappings for managing tabs
map <leader>p :tabfind<space>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<cr>

" Toggle spelling visuals
nnoremap <leader>s :set spell!

" Switch to specific buffer (see which buffers are open using above)
nmap <leader>sb :b

" Show all open buffers and their status
nmap <leader>ss :ls<cr>

" Source vimrc file
nnoremap <leader>sv :source ~/.vimrc<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" To open a new empty buffer
nmap <leader>tn :enew<cr>

" Split window verticaly
nmap <leader>v <C-W><C-v>

" Fast saving
nnoremap <leader>w :w!<return>

"####################################################################################################
"####################################################################################################
"####   3. Filetype / Extension Specific      <f_ext>    ############################################
"####################################################################################################
"####################################################################################################

"####################################################################################################
"########   3.1 Filetype/Extension Specific - Java      <f_java>    #################################
"####################################################################################################

au FileType java setl sw=2 sts=2 et

"####################################################################################################
"########   3.2 Filetype/Extension Specific - Ruby      <f_ruby>    #################################
"####################################################################################################

au FileType ruby setl sw=2 sts=2 et

"####################################################################################################
"########   3.3 Filetype/Extension Specific - SCSS      <f_scss>    #################################
"####################################################################################################

au FileType scss setl sw=2 sts=2 et

"####################################################################################################
"########   3.4 Filetype/Extension Specific - TypeScript      <f_tysc>    ###########################
"####################################################################################################

au FileType typescript setl sw=2 sts=2 et

"####################################################################################################
"########   3.5 Filetype/Extension Specific - YAML      <f_yaml>    #################################
"####################################################################################################

au FileType yaml setl sw=2 sts=2 et

"####################################################################################################
"####################################################################################################
"####   4. Plugins      <plug>    ###################################################################
"####################################################################################################
"####################################################################################################

"####################################################################################################
"########   4.1 Plugins - Pathogen      <plug_path>    ##############################################
"####################################################################################################

" Pathogen
set nocp
execute pathogen#infect()

"####################################################################################################
"####################################################################################################
"####   5. Archived      <archive>    ###############################################################
"####################################################################################################
"####################################################################################################

" Delete current file and close buffer
"nnoremap <leader>rm delete(expand('%')) | bdelete!<CR>

" Visual mode pressing * or # searches for current selection
"   -> Need to add 'VisualSelection'?
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

" Fix spelling
"nnoremap <leader>f 1z=

" filetype plugin on
" filetype indent on

" Linebreak on 500 characters
"set lbr
"set tw=500

"   -> Removed for conflict with buffer behaviour
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

" Open file based on current directory
"nmap <leader>f :e <c-r>=expand("%:p:h")<cr>/

" Turn off auto adding comments on next line
"set fo=tcq

"nmap <leader><TAB> <C-6>

