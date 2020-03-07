" ###  ## #### ###  ##       ######  #####  ######  ###### ####  #####
" ###  ##  ### ### ###      ###  ## ###  ## ###  ## ###     ### ###  ##
" ###  ##  ### #######      ###     ###  ## ###  ## ###     ### ###
" ###  ##  ### ## # ##      ###     ###  ## ###  ## #####   ### ### ###
" ###  ##  ### ## # ##      ###     ###  ## ###  ## ###     ### ###  ##
"  #####   ### ##   ##      ###  ## ###  ## ###  ## ###     ### ###  ##
"   ###    ### ##   ##       #####   #####  ###  ## ###     ###  #####

" Map leader to space
let mapleader =" "
" ~/Documents/notes/
let g:notes_directories = ['~/Documents/Notes']
" CtrlP runtimepath
set runtimepath^=~/.vim/plugged/ctrlp.vim

" Plugin
call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'		" A Personal Wiki For Vim
Plug 'xolox/vim-notes'		" For taking note, of course
Plug 'tpope/vim-surround'	" Change parentheses and stuff with ease
Plug 'xolox/vim-misc'		" Miscellaneous auto-load Vim scripts
Plug 'preservim/nerdtree'	" A tree explorer plugin for vim
Plug 'Valloric/YouCompleteMe'	" Ycm code-suggestion engine
Plug 'jiangmiao/auto-pairs'	" Autopair parentheses and stuff
"Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'	" Vim plugin that displays tags in a window
Plug 'ctrlpvim/ctrlp.vim'	" Fuzzy file, buffer, mru, tag, ... finder
Plug 'universal-ctags/ctags'	" Universal tags for codes
"Install Exuberant Ctags 'sudo eopkg it ctags' which is a dependency
"To build with Autotools, see docs/autotools.rst for more information
Plug 'airblade/vim-gitgutter'
" A Vim plugin which shows a git diff in the gutter (sign column)
" and stages/undoes hunks and partial hunks

Plug 'gioele/vim-autoswap'	" No more swap files!
Plug 'vim-airline/vim-airline'	" Lean & mean tabline for vim
Plug 'morhetz/gruvbox'		" GruvBox colorscheme
Plug 'junegunn/goyo.vim'	" <Leader>gy toggle reading mode
Plug 'frazrepo/vim-rainbow'	" Rainbow parentheses

Plug 'jeetsukumaran/vim-buffergator'
"Use <Leader>b to open a window listing all buffers
"<ENTER> to edit the selected buffer in the previous window
"<C-V> to edit the selected buffer in a new vertical split
"<C-S> to edit the selected buffer in a new horizontal split
"<C-T> to edit the selected buffer in a new tab page
"Use gb and gB to flip through the most-recently used buffer
"Use <Leader><LEFT>, <Leader><UP>, <Leader><RIGHT>, <Leader><DOWN> to
"split a new window left, up, right, or down, respectively,
"and edit the previous MRU buffer there.

Plug 'preservim/nerdcommenter'	" Easy comment out lines of codes
Plug 'davidhalter/jedi-vim'	" Awesome Python autocompletion
call plug#end()

" Some basic:
set nocompatible	" be iMproved, required
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
" Copy selected text to system clipboard (requires gvim installed):
set clipboard=unnamedplus
" Enable autocompletion:
set wildmode=longest,list,full
" Use vim-markdown as default and keep snippets
autocmd FileType vimwiki set ft=markdown
let g:notes_alt_indents = 1
" Write, compile and execute C code
map <F9> :w<CR> :!gcc % -o %< && ./%<<CR>

" GitGutter update sign column every 1/10 second
set updatetime=100
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Setting background color of sign column to general background color
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gp <Plug>GitGutterPrevHunk
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" From http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
" Leader-j/k insert blank line below/above
nnoremap <leader>j mao<Esc>`a
nnoremap <leader>k maO<Esc>`a

" Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-up> :tabr<CR>
nnoremap <C-down> :tabl<CR>
nnoremap <C-left> :tabp<CR>
nnoremap <C-right> :tabn<CR>
" Automatically VimResized
autocmd VimResized * wincmd =
" Automatically deletes all trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e
" Make Vim open help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
" Change cursor shape for different vi modes.
if has("autocmd")
au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[5 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[3 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" Make the 81st column stand out
highlight ColorColumn ctermbg=cyan
call matchadd('ColorColumn', '\%81v', 100)
" Setup for gruvbox
set t_Co=256
set background=dark
colorscheme gruvbox
" Get title for Autoswap
set title titlestring=

" Set up smarter search behaviour
set incsearch       " Lookahead as search pattern is specified
set ignorecase      " Ignore case in all searches...
set smartcase       " ...unless uppercase letters used
set hlsearch        " Highlight all matches
highlight clear Search
highlight       Search    ctermfg=White  ctermbg=Cyan  cterm=bold
highlight    IncSearch    ctermfg=White  ctermbg=Red    cterm=bold
" Remove all hightlight
nnoremap <leader>hl :noh<CR>

" Remap ESC key
" Press ii to return to normal mode
inoremap ii <ESC>
" inoremap <ESC> <NOP>
set t_BE=	" Fix paste bug caused by the above inoremap
vnoremap ii <ESC>
" vnoremap <ESC> <NOP>
cnoremap ii <ESC>
" Paste without messing up indentation
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>"

"" Some setting for Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_auto_jump = 1
"" Make Syntastic error window smaller if fewer than 10 errors are found
    "function! SyntasticCheckHook(errors)
        "if !empty(a:errors)
            "let g:syntastic_loc_list_height = min([len(a:errors), 10])
        "endif
    "endfunction

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',}
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1
" Tagbar toggle
nmap <F8> :TagbarToggle<CR>
" Goyo toggle
nmap <leader>gy :Goyo<CR>

" NERDtree shortcut
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tab completion
set wildmode=longest,list,full
set wildmenu

" Installed YouCompleteMe with both 'libclang' and 'clangd' enabled. In that case 'clangd' will
" be preferred unless you have the following
" let g:ycm_use_clangd = 0
" YCM semantic completion to automatically trigger after typing two characters
let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}'  ]
	\}
" Trigger completion for C
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1

"" Enable Autopair's Fly Mode for always force closed-pair jumping instead of inserting
"" and map some short cuts
"let g:AutoPairsFlyMode = 1
"" let g:AutoPairsShortcutBackInsert = '<leader>b'
"" let g:AutoPairsShortcutJump = '<leader>n'

" Fix Ctrl+Arrows
" Need to add the following to .tmux.conf.local
" set-window-option -g xterm-keys on
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Enable vim-rainbow globally
let g:rainbow_active = 1
