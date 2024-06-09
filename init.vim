set number relativenumber
set mouse=a
set colorcolumn=80
set termguicolors
set signcolumn=yes
set foldmethod=syntax
set incsearch

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

let g:pymode=1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:gitgutter_highlight_linenrs=1
let g:gitgutter_set_sign_background=1
highlight! link SignColumn LineNr
let g:vim_markdown_math = 1

call plug#begin()
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
"   - e.g. `call plug#begin('~/.vim/plugged')`

Plug 'junegunn/vim-plug'

" Better visual
" Plug 'karb94/neoscroll.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-lua/plenary.nvim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'folke/todo-comments.nvim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

" Language support
Plug 'github/copilot.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Editing tools
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" General
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

colorscheme gruvbox
" lua require('neoscroll').setup({easing_function = "quadratic"})
lua require("todo-comments").setup()

source ~/.config/nvim/coc.vim

