set nocompatible
set undofile
set undodir=~/mvim/undo
set shell=/bin/sh
set runtimepath+=~/mvim/


" ----------------------------------------------------------------------------
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------
if has('autocmd')
  filetype plugin indent on     " Turn on Filetype detection, plugins, and indent
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable                 " Turn on syntax highlighting
endif

if exists('+colorcolumn')
  set colorcolumn=72    " display a line in column 72
endif

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default
set diffopt+=vertical       " diff mode with vertical splits please

"-----------------------------------------------------------------------------
" ag setup
"-----------------------------------------------------------------------------
if executable('ag') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c:%m
endif

"-----------------------------------------------------------------------------
" Pathogen setup
"-----------------------------------------------------------------------------
set nocp
source ~/mvim/autoload/pathogen.vim
execute pathogen#infect()

"-----------------------------------------------------------------------------
" text editing and moving around
"-----------------------------------------------------------------------------

set showcmd           " show incomplete commands as they are typed
set showmatch         " when inserting a bracket, jump to its match
set nostartofline     " keep cursor in same column for long-range motion cmds
set history=200       " save more commands in history
set incsearch	      " Highlight pattern matches as you type
set ignorecase	      " ignore case when using a search pattern
set smartcase	      " override 'ignorecase' when pattern has upper case character
set scrolloff=3       " number of screen lines to show around cursor
set linebreak	      " for lines longer than the window, wrap intelligently
set showbreak=↪\ \    " string to put before wrapped screen lines
set sidescrolloff=2   " min # of columns to keep left/right of cursor
set display+=lastline " show last line, even if it doesn't fit in the window
set cmdheight=2       " # of lines for the command window
                      " cmdheight=2 helps avoid 'Press ENTER...' prompts
set number            " show line numbers
set confirm           " ask to save buffer when executing command that close buffers

" ----------------------------------------------------------------------------
"  lightline.vim, lightline.ale and ALE settings
" ----------------------------------------------------------------------------
"  ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let b:ale_linters = ['eslint']
let g:ale_loclist_msg_format='%linter%: %code: %%s'
let g:ale_completion_enabled = 1
" LIGHTLINE
set laststatus=2  " sets lightline status line at bottom
set noshowmode    " remove the insert status at bottom, redundant
if !has('gui_running')
  set t_Co=256
endif
let g:lightline#extensions#ale#enabled = 1
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'active': {
   \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
   \     'right': [ [ 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing', 'lineinfo' ], [ 'fileinfo', 'filetype' ], [ 'scrollbar' ] ],
   \ },
   \ 'inactive': {
   \     'left': [ [ 'pwd' ] ],
   \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
   \ },
   \ 'component_expand': {
   \     'linter_checking': 'lightline#ale#checking',
   \     'linter_warnings': 'lightline#ale#warnings',
   \     'linter_errors': 'lightline#ale#errors',
   \     'linter_ok': 'lightline#ale#ok',
   \ },
   \ 'component_type': {
   \     'linter_checking': 'left',
   \     'linter_warnings': 'warning',
   \     'linter_errors': 'error',
   \     'linter_ok': 'left',
   \ }
\ }

" ----------------------------------------------------------------------------
"  multiple windows
" ----------------------------------------------------------------------------
set laststatus=2  	  " Show a status line, even if there's only one
                      " Vim window

set hidden		    	  " allow switching away from current buffer w/o
                      " writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
set statusline=
set statusline+=b%-1.3n\ >                    " buffer number
set statusline+=\ %{fugitive#statusline()}:
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c   	" cursor line/total lines
set helpheight=30         " Set window height when opening Vim help windows
set ttyfast			     

" ----------------------------------------------------------------------------
"  tabs and indenting
" ----------------------------------------------------------------------------
set tabstop=2             " tab = 2 spaces
set shiftwidth=2          " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=2
set shiftround            " round to 'shiftwidth' for "<<" and ">>" 
set expandtab

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		    " When opening files, all folds open by default
endif

set foldtext=NeatFoldText()
