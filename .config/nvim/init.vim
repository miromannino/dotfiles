" VIM basic configuration in .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" --------------------------- 
"  Plugins
" --------------------------- 
call plug#begin('~/.vim/plugged')

  if !exists('g:vscode')

    Plug 'neoclide/coc.nvim', {'branch': 'release'} "conquer of completion
    Plug 'ctrlpvim/ctrlp.vim' "fuzzy find files

    "nvim-telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " NvimTree
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " Theme
    Plug 'navarasu/onedark.nvim'

    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Scrollbars
    Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

  else 

    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

  endif

call plug#end()

