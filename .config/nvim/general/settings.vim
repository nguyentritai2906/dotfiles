set nocompatible " Be iMproved, required
filetype plugin indent on " https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
syntax on
set encoding=utf-8
set autoread " detect when a file is changed
set backupdir=~/.vim/tmp/backup//,. " set directory for backup files
set directory=~/.vim/tmp/swap//,. " ... swap files
set undodir=~/.vim/tmp/undo//,. " ... and undo files
set undofile
set title titlestring= " Get title - dealing with swap files - Autoswap
set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamedplus
set updatetime=100 " Update sign column every 1/10 of a second
set ttimeoutlen=0 " No key code timeout
set conceallevel=2
set wildmode=longest,full " Tab completion
set wildmenu " enhanced command line completion
set wildcharm=<Tab>
set pastetoggle=<F2>
set dictionary+=/usr/share/dict/words
set mouse=a
set foldmethod=expr
set foldnestmax=3

" Searching
set incsearch " lookahead as search pattern is specified
set ignorecase " ignore case in all searches...
set smartcase " unless uppercase letters used
set wildignorecase " Command line completion ignore case
set hlsearch " highlight all matches
let @/ = "" " highlight search but not when source .vimrc
set lazyredraw " don't redraw while executing macros
set tags=tags;/ " Check current folder for tags file and keep going one directory up all the way to the root folder

" Apprearance
colorscheme dracula
set t_Co=256 " explicitly tell vim that the terminal supports 256 colors
set number relativenumber
set background=dark
set shell=$SHELL
set autoindent " automatically set indent of new line
set signcolumn=yes " always show signcolumn
set cursorline
set ttyfast " faster redrawing
set scrolloff=5
set splitright

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab
set guicursor=n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20

" Make the 81st column stand out
" IMPORTANT: load the colorscheme before ctermbg settings in .vimrc
" because they need to override the same ones set by the colorscheme.
highlight ColorColumn ctermbg=darkcyan
call matchadd('ColorColumn', '\%81v', 100)

" Search
    " Highlight
    highlight		Normal		guibg=NONE	 ctermbg=NONE
    highlight         link      Searchlight  IncSearch

    highlight link VimwikiHeader1 DraculaRed
    highlight link VimwikiHeader2 DraculaGreen
    highlight link VimwikiHeader3 DraculaComment
    highlight link VimwikiHeader4 DraculaPurple
    highlight link VimwikiHeader5 DraculaCyan
    highlight link VimwikiHeader6 DraculaYellow

    " Add DONE to TODO highlighting group
    " https://stackoverflow.com/questions/4162664/vim-highlight-a-list-of-words
    match Todo /DONE\|NOTE/

    " Center search hit and automatically clear highlight with is.vim
    nnoremap <silent> <F4> :call <SID>SearchMode()<CR>
    " Default to 'Middle'
    nmap <silent> n <Plug>(is-n)zz
    nmap <silent> N <Plug>(is-N)zz