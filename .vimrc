"-----------------------------------------
" GENERIC
"-----------------------------------------
set encoding=utf-8

set number

" Incremental search
set incsearch

" Allow exit from file even if is not saved
set hidden 

" Enable mouse
set mouse=a

" Sounds off
set belloff=all
set novisualbell

" Time vim waits after you stop typing before triggering plugins
set updatetime=300

let mapleader = " " "map leader to space


"-----------------------------------------
" COPY&PASTE
"-----------------------------------------
" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore. You have to explicitly yank it.
"-----------------------------------------
nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P
vnoremap y "+y
nnoremap y "+y
" to have x to only work in visual mode to cut text
nnoremap X "_D
nnoremap x "_x
vnoremap x "+x

"-----------------------------------------
" Tabs & Indentation 
"-----------------------------------------
set tabstop=2 "width of the TAB character set to 2 spaces
set softtabstop=2 "what happens when TAB or BS keys are pressed
set expandtab "what happens when TAB is pressed
set shiftwidth=2 "what happens when >>, << and auto indentation

"affects how TAB key is interpreted. With this ON the TAB
"key inserts indentation according to shiftwidth if the 
"cursor is at the beginning of a line, otherwise it will 
"be using tabstop and softtabstop.
set smarttab

"Don't remove the selection after indentation
xnoremap > >gv
xnoremap < <gv

"Use TAB and SHIFT-TAB to indent quicker than > and <
xnoremap <tab> >gv
xnoremap <S-Tab> <gv

set autoindent 

"-----------------------------------------
" Move through wrapped lines (e.g. in Markdown files)
"-----------------------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"-----------------------------------------
" Move through windows/panels quicker
" 
" In VSCode to keep this behaviour add in keybindings.json, otherwise this wouldn't always work
" if the cursor goes where vim is not active (e.g. from file explorer C-l to go back to editor)
"
  {
    "key": "ctrl+h",
    "command": "workbench.action.navigateLeft"
  },
  {
    "key": "ctrl+l",
    "command": "workbench.action.navigateRight"
  },
  {
    "key": "ctrl+k",
    "command": "workbench.action.navigateUp"
  },
  {
    "key": "ctrl+j",
    "command": "workbench.action.navigateDown"
  }
"
"-----------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

