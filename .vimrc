" ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
"   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝



" Plugin {{{
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
	Plug 'Yggdroot/indentLine'	" Display indentation level
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
" }}}

" General settings {{{

    set nocompatible	" Be iMproved, required
    filetype plugin on	" Required
    syntax on 		" For C syntax check, change C++11 to C99 in .vim/.ycm_extra_conf.py
    set encoding=utf-8
    set autoread " detect when a file is changed
    set backupdir=~/.vim/tmp//,. " set directory for backup files
    set directory=~/.vim/tmp//,. " and swap files
    set runtimepath^=~/.vim/plugged/ctrlp.vim "CtrlP runtimepath
    set title titlestring= " Get title - dealing with swap files - Autoswap
    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamedplus
    set updatetime=100 " Update sign column every 1/10 second

    set wildmode=longest,list,full " Tab completion
    set wildmenu " enhanced command line completion

    " Searching
    set incsearch " lookahead as search pattern is specified
    set ignorecase " ignore case in all searches...
    set smartcase " unless uppercase letters used
    set hlsearch " highlight all matches
    set nolazyredraw " don't redraw while executing macros

    " Apprearance
    colorscheme gruvbox
    set t_Co=256 " explicitly tell vim that the terminal supports 256 colors
    set number relativenumber
    set background=dark
    set shell=$SHELL
    set autoindent " automatically set indent of new line
    set signcolumn=auto " only show signcolumn when there's sign

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

	" Change cursor shape for different vi modes.
	if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
	au InsertEnter,InsertChange * if v:insertmode == 'i' |
				\silent execute '!echo -ne "\e[5 q"' | redraw! |
				\elseif v:insertmode == 'r' |
				\silent execute '!echo -ne "\e[3 q"' | redraw! |
				\endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
	endif

" }}}

" General mapping {{{
	" map leader to space
    let mapleader=" "

	" remap ESC
	inoremap ii <ESC>
	vnoremap ii <ESC>
	cnoremap ii <ESC>

	" clear all highlight
	nnoremap <leader>hl :noh<CR>

	" remove trailing whilespace
	autocmd BufWritePre * %s/\s\+$//e

    " keep visual selection when indenting/outdenting
    vmap < <gv
    vmap > >gv

	" write, compile and execute C code
	map <F6> :w<CR> :!gcc % -o %< && ./%<<CR>

	" terminal inside Vim
	nmap <Leader>\t :bel vert term<CR>

	" visual selection of indent level
	function SelectIndent()
	let cur_line = line(".")
	let cur_ind = indent(cur_line)
	let line = cur_line
	while indent(line - 1) >= cur_ind
		let line = line - 1
	endw
	exe "normal " . line . "G"
	exe "normal V"
	let line = cur_line
	while indent(line + 1) >= cur_ind
		let line = line + 1
	endw
	exe "normal " . line . "G"
	endfunction
	nnoremap vil :call SelectIndent()<CR>

	" insert blank line
	nnoremap <leader>j mao<Esc>`a
	nnoremap <leader>k maO<Esc>`a

	" Paste without messing up indentation
	"noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>"

	" Highlight
	hi Normal guibg=NONE ctermbg=NONE

	" Make the 81st column stand out
	" IMPORTANT: load the colorscheme before ctermbg settings in .vimrc
	" because they need to override the same ones set by the colorscheme.
	highlight ColorColumn ctermbg=darkcyan
	call matchadd('ColorColumn', '\%81v', 100)

	" custom search highlight
	highlight       Search    ctermfg=Black  ctermbg=208    cterm=bold
	highlight    IncSearch    ctermfg=Black  ctermbg=Red    cterm=bold
" }}}

" AutoGroups {{{
	" Automatically VimResized
	autocmd VimResized * wincmd =

	" Make Vim open help in a vertical split
	augroup vimrc_help
	autocmd!
	autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
	augroup END

" }}}

" General Functionality {{{
	" Notes
	" ~/Documents/note/
	let g:notes_directories = ['~/Documents/note']

	" GitGutter
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
				\'dir':  '\v[\/]\.(git|hg|svn)$',
				\'file': '\v\.(exe|so|dll)$',
				\'link': 'some_bad_symbolic_links',}
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
	let g:ctrlp_show_hidden = 1

	" NERDtree and Tagbar
	" Toggle Tagbar
	nmap <F8> :TagbarToggle<CR>
	" Toggle NERDtree
	nmap <F7> :NERDTreeToggle<CR>
	" Toggle both
	nnoremap <F9> :TagbarToggle<CR> :NERDTreeToggle<CR>
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
	let g:ycm_semantic_triggers = {'python': [ 're!\w{2}' ]}
	" Trigger completion for C
	let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
	let g:ycm_show_diagnostics_ui = 1
	"Populate vims location list with new diagnostic data
	"Use :lnext and :lprev - Jump to next or previous error in list
	let g:ycm_always_populate_location_list = 1

	" AutoPair
	" Enable Autopair's Fly Mode for always force closed-pair jumping instead of inserting
	" and map some short cuts
	let g:AutoPairsFlyMode = 1

	" Rainbow
	" Enable vim-rainbow globally
	let g:rainbow_active = 1

	" Termdebug
	" Arrange windows
	"autocmd filetype cpp,c nnoremap <F6> :Termdebug %:r<CR><c-w>2j<c-w>L

	" Buffergator
	" Disable default mapping
	let g:buffergator_suppress_keymaps = 1
	" Toggle open
	nmap <leader>b :BuffergatorOpen<CR>

	"" Writing
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
" }}}







