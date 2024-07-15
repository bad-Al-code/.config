" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable syntax highlighting
syntax enable

" Set auto-indentation
set smartindent
set tabstop=4
set shiftwidth=2
set expandtab

" Highlight search results as you type
set incsearch

" Enable mouse support
set mouse=a

" Highlight matching parentheses
set showmatch

" Display matching brackets/parentheses
set showmatch

" Enable line wrapping
set wrap

" Show line and column number in the status line
set ruler

" Enable line and column number in command mode
set rulerformat=%l,%v

" Highlight current line
set cursorline

" Enable line continuation
set backspace=indent,eol,start

" Display matching parentheses
set showmatch

" Enable clipboard support (requires Vim to be compiled with +clipboard)
set clipboard=unnamedplus

" Enable file type detection
filetype plugin indent on

" Enable auto-command syntax for specific file types
augroup filetypedetect
    autocmd BufRead,BufNewFile *.html set filetype=html
    autocmd BufRead,BufNewFile *.css set filetype=css
    " Add more file type detections as needed
augroup END

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

colorscheme default 

