" some plugins expect this lazy config path specifically
lua require("config.lazy")

" custom configs come later to override plugin defaults

set colorcolumn=81,101,121
set mouse=a
set signcolumn=yes:2

" will be overridden by vim-sleuth
set expandtab
set shiftwidth=4
set tabstop=4

let g:python3_host_prog = "~/venvs/nvim/bin/python"

" Neovide configs

if !exists("g:neovide")
	finish
endif

set guifont=MonoLisaVariable\ Nerd\ Font:h18
" needs to be loaded after gruvbox-material theme
hi Normal guibg=#252423 " adapted from gruvbox material bg0
" paste from system clipboard, somehow not working in Neovide
nnoremap <D-v>      "+p
vnoremap <D-v>      "+p
inoremap <D-v>  <C-r>+
cnoremap <D-v>  <C-r>+
tnoremap <D-v>  <C-r>+
