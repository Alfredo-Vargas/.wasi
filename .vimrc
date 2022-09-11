" to skip defaults on force the current configuration
" let skip_defaults_vim=1
" Tips
" q: (to list your command history)
" noh (to remove the highlight)

syntax enable
filetype plugin indent on
set fileencoding=utf-8
set ruler
set laststatus=0
set textwidth=73
set linebreak

set relativenumber
" set norelativenumber
set nocompatible
set number

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set autoindent

" keep the cursor on the middle of the screen
" set scrolloff=999
set scrolloff=7
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨

set icon
set guifont=JetBrains\ Mono\ 20
set hlsearch
set shortmess=aoOtI
set incsearch

" prevents truncated yanks, deletes, etc
" viminfo buffer is how cut and paste persists among different files
set viminfo='20,<1000,s1000 " Rob's previous option
" set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" living dangerously (but cleanly)
set nobackup
set nowritebackup
set noswapfile

" not a fan of bracket matching nor folding (zf/zd)
" avoid folding to do quick explicit search without needed to unfold
let g:loaded_matchparen=1
set noshowmatch
set foldmethod=manual

" explicit defaults
set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join 
set formatoptions+=1   " don't break a line after a one-letter word

if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

" This will automatically load a vimrc located on the same dir of the
" file you are editing (dangerous)
" set exrc
" set secure

" memory management
set hidden  " stops complaints about switching buffer with changes 
set history=100

" allow sensing the filetype
filetype plugin on

set noesckeys
set ignorecase
set smartcase
set autochdir
set cinoptions=l1

colorscheme desert
" set background=dark

inoremap jk <ESC>
let g:mapleader = "\<Space>"
" pane switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

hi Normal guibg=NONE ctermbg=NONE
set viminfo='20,<1000,s100 " prevents truncated yanks, deletes, etc (deprecated on neovim)


" no arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>


" read personal/private vim configuration (keep last to override)
" set rtp^=~/.vimpersonal
" set rtp^=~/.vimprivate
