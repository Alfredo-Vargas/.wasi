syntax on
filetype plugin indent on
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set guifont=JetBrains\ Mono\ 20
"set guifont=Iosevka\ 20
set guioptions-=m
set guioptions-=T
set noesckeys
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set autochdir
set cinoptions=l1
colorscheme desert
inoremap jk <ESC>
let g:mapleader = "\<Space>"

" pane switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE
set viminfo='20,<1000,s100 " prevents truncated yanks, deletes, etc (deprecated on neovim)
autocmd Filetype gitcommit setlocal spell texwidth=72


" no arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
