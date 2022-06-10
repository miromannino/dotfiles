" VIM basic configuration in .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" --------------------------- 
"  Plugins
" --------------------------- 
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} "conquer of completion
Plug 'ctrlpvim/ctrlp.vim' "fuzzy find files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" NvimTree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Theme
Plug 'projekt0n/github-nvim-theme'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

call plug#end()

colorscheme github_dark_default
