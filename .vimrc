"   ###  ## #### ###  ##       ######  #####  ######  ###### ####  #####
"   ###  ##  ### ### ###      ###  ## ###  ## ###  ## ###     ### ###  ##
"   ###  ##  ### #######      ###     ###  ## ###  ## ###     ### ###
"   ###  ##  ### ## # ##      ###     ###  ## ###  ## #####   ### ### ###
"   ###  ##  ### ## # ##      ###     ###  ## ###  ## ###     ### ###  ##
"    #####   ### ##   ##      ###  ## ###  ## ###  ## ###     ### ###  ##
"     ###    ### ##   ##       #####   #####  ###  ## ###     ###  #####


" Plugin
call plug#begin('~/.vim/plugged')

" Writing
" Wiki for Vim
"Plug 'vimwiki/vimwiki', {'branch': 'dev'}
"Plug 'plasticboy/vim-markdown'	" Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'xolox/vim-notes'		" For taking note, of course

" Dev
Plug 'Valloric/YouCompleteMe'	" Ycm code-suggestion engine
Plug 'davidhalter/jedi-vim'	" Awesome Python autocompletion
Plug 'ctrlpvim/ctrlp.vim'	" Fuzzy file, buffer, mru, tag, ... finder
Plug 'preservim/nerdtree'	" A tree explorer plugin for vim
Plug 'tpope/vim-surround'	" Change parentheses and stuff with ease
Plug 'jiangmiao/auto-pairs'	" Autopair parentheses and stuff
Plug 'frazrepo/vim-rainbow'	" Rainbow parentheses
Plug 'preservim/nerdcommenter'	" Easy comment out lines of codes

" Tags
Plug 'majutsushi/tagbar'	" Vim plugin that displays tags in a window
Plug 'universal-ctags/ctags'	" Universal tags for codes
"Install Exuberant Ctags 'sudo eopkg it ctags' which is a dependency
"To build with Autotools, see docs/autotools.rst for more information
Plug 'xolox/vim-easytags' 	" Automated tag file generation and syntax highlighting of tags in Vim
Plug 'xolox/vim-misc'		" Miscellaneous auto-load Vim scripts, required for xolox's pluggin

" Git
Plug 'airblade/vim-gitgutter'
" A Vim plugin which shows a git diff in the gutter (sign column)
" and stages/undoes hunks and partial hunks

Plug 'gioele/vim-autoswap'	" No more swap files!

" UI
Plug 'vim-airline/vim-airline'	" Lean & mean tabline for vim
Plug 'morhetz/gruvbox'		" GruvBox colorscheme
Plug 'lilydjwg/colorizer'	" Colorize all text in form of #rrggbb and #rgb
Plug 'yuttie/comfortable-motion.vim' 	" Physics-based smooth scrolling
Plug 'junegunn/goyo.vim'	" <Leader>gy toggle reading mode
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

call plug#end()

" Basic settings
set nocompatible	" Be iMproved, required
filetype plugin on	" Required
syntax on 		" For C syntax check, change C++11 to C99 in .vim/.ycm_extra_conf.py
set encoding=utf-8
set number relativenumber
let mapleader =" "	" Map leader to space

" UI
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
" Automatically VimResized
autocmd VimResized * wincmd =
" Make Vim open help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Macro
" Write, compile and execute C code
map <F9> :w<CR> :!gcc % -o %< && ./%<<CR>
" From http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
" Leader-j/k insert blank line below/above
nnoremap <leader>j mao<Esc>`a
nnoremap <leader>k maO<Esc>`a
" Automatically deletes all trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e
" Save folds when exit, load folds when open
" https://github.com/spf13/spf13-vim/issues/766
augroup remember_folds
	autocmd!
	autocmd BufWinLeave ?* mkview
	autocmd BufWinEnter ?* silent! loadview
augroup END

" Writing
"" From https://dev.to/konstantin/taking-notes-with-vim-3619
"" Vimwiki
""let g:vimwiki_list = [{ 'path': '~/Documents/note/' }]
""let g:vimwiki_list = [{'path': '~/Documents/note/',
		       ""\ 'syntax': 'markdown', 'ext': '.md'}]
"" Markdown
"" Use vim-markdown as default and keep snippets
""autocmd FileType vimwiki set ft=markdown
"" Disable default mapping
""let g:vim_markdown_no_default_key_mappings = 1
" Notes
" ~/Documents/note/
let g:notes_directories = ['~/Documents/note']
" Indents
" Redefine as 4 space
" From here https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Search
" Smarter search
set incsearch       " Lookahead as search pattern is specified
set ignorecase      " Ignore case in all searches...
set smartcase       " ...unless uppercase letters used
set hlsearch        " Highlight all matches
" Remove all highlight
nnoremap <leader>hl :noh<CR>

" Autoswap
" Get title
set title titlestring=

" Remap ESC
" Press ii to return to normal mode
inoremap ii <ESC>
" inoremap <ESC> <NOP>
set t_BE=	" Fix paste bug caused by the above inoremap
vnoremap ii <ESC>
" vnoremap <ESC> <NOP>
cnoremap ii <ESC>

" Copy and Paste
" Copy selected text to system clipboard (requires gvim installed):
set clipboard=unnamedplus
" Paste without messing up indentation
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>"

" Navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"nnoremap <C-up> :tabr<CR>
"nnoremap <C-down> :tabl<CR>
"nnoremap <C-left> :tabp<CR>
"nnoremap <C-right> :tabn<CR>
"" Fix Ctrl+Arrows
"" Need to add the following to .tmux.conf.local
"" set-window-option -g xterm-keys on
"if &term =~ '^screen'
    "" tmux will send xterm-style keys when its xterm-keys option is on
    "execute "set <xUp>=\e[1;*A"
    "execute "set <xDown>=\e[1;*B"
    "execute "set <xRight>=\e[1;*C"
    "execute "set <xLeft>=\e[1;*D"
"endif

" Gruvbox
" Setup for gruvbox
set t_Co=256
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
" Make the 81st column stand out
" It's important to load the colorscheme before the ctermbg settings in .vimrc
" because they need to override the same ones set by the colorscheme.
highlight ColorColumn ctermbg=darkcyan
call matchadd('ColorColumn', '\%81v', 100)
"Clear Search which is the highlight that vim uses to highlight search matches
"Then add new custom config
"highlight clear Search
"highlight clear IncSearch
highlight       Search    ctermfg=Black  ctermbg=208    cterm=bold
highlight    IncSearch    ctermfg=Black  ctermbg=Red    cterm=bold

" GitGutter
" Update sign column every 1/10 second
set updatetime=100
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Turn off sign column highlight
let g:gitgutter_override_sign_column_highlight = 1
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gN <Plug>(GitGutterPrevHunk)

" CtrlP
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
" CtrlP runtimepath
set runtimepath^=~/.vim/plugged/ctrlp.vim

" Tagbar
" Toggle
nmap <F8> :TagbarToggle<CR>

" NERDtree
" Toggle
map <C-n> :NERDTreeToggle<CR>

"" Open NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompeleteMe
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
"Populate vims location list with new diagnostic data
"Use :lnext and :lprev - Jump to next or previous error in list
let g:ycm_always_populate_location_list = 1
" Tab completion
set wildmode=longest,list,full
set wildmenu

" AutoPair
" Enable Autopair's Fly Mode for always force closed-pair jumping instead of inserting
" and map some short cuts
let g:AutoPairsFlyMode = 1

" Rainbow
" Enable vim-rainbow globally
let g:rainbow_active = 1

" Termdebug
" Arrange windows
autocmd filetype cpp,c nnoremap <F6> :Termdebug %:r<CR><c-w>2j<c-w>L

" Buffergator
" Disable default mapping
let g:buffergator_suppress_keymaps = 1
" Toggle open
nmap <leader>b :BuffergatorOpen<CR>
