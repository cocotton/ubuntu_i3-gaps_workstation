execute pathogen#infect()

syntax on
filetype plugin on

colorscheme jellybeans

set smartindent
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start

autocmd BufWritePre * :%s/\s\+$//e
