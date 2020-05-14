" ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
"   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝



" Plugin {{{

	call plug#begin('~/.vim/plugged')

	" Dev
	Plug 'Valloric/YouCompleteMe'	" Ycm code-suggestion engine
	Plug 'davidhalter/jedi-vim'		" Awesome Python autocompletion
	Plug 'rking/ag.vim'				" Vim plugin for The-Silver-Searcher
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'			" General-purpose command-line fuzzy finder vim integration
	Plug 'preservim/nerdtree'		" A tree explorer plugin for vim
	Plug 'simnalamburt/vim-mundo'	" Graph vim undo tree
	Plug 'tpope/vim-surround'		" Change parentheses and stuff with ease
	Plug 'jiangmiao/auto-pairs'		" Autopair parentheses and stuff
	Plug 'luochen1990/rainbow'		" Rainbow parentheses
	Plug 'preservim/nerdcommenter'	" Easy comment out lines of codes
	Plug 'airblade/vim-gitgutter' " Git diff, stages/undoes hunks and partial hunks

	" Tags
	Plug 'majutsushi/tagbar'	" Vim plugin that displays tags in a window
	Plug 'universal-ctags/ctags'	" Universal tags for codes
	"Install Exuberant Ctags 'sudo eopkg it ctags' which is a dependency
	"To build with Autotools, see docs/autotools.rst for more information
	Plug 'xolox/vim-easytags' 	" Automated tag file generation and syntax highlighting of tags in Vim
	Plug 'xolox/vim-misc'		" Miscellaneous auto-load Vim scripts, required for xolox's pluggin

	" Make life easier
	Plug 'gioele/vim-autoswap'	" No more swap files!

	" UI
	Plug 'vim-airline/vim-airline'	" Lean & mean tabline for vim
	Plug 'morhetz/gruvbox'		" GruvBox colorscheme
	Plug 'joshdick/onedark.vim'	" OneDark colorscheme
	Plug 'dracula/vim', { 'as': 'dracula'  } " GruvBox colorscheme
	Plug 'lilydjwg/colorizer'	" Colorize all text in form of #rrggbb and #rgb
	Plug 'Yggdroot/indentLine'	" Display indentation level
	Plug 'junegunn/goyo.vim'	" <Leader>gy toggle reading mode
	Plug 'haya14busa/is.vim'	" Incremental search improved

	" Navigation
	Plug 'easymotion/vim-easymotion' " Vim motions on speed
	Plug 'yuttie/comfortable-motion.vim' " Physics-based smooth scrolling
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

	" Writing
	" Wiki for Vim
	"Plug 'vimwiki/vimwiki', {'branch': 'dev'}
	"Plug 'plasticboy/vim-markdown'	" Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
	Plug 'xolox/vim-notes'			" For taking note, of course

	call plug#end()

" }}}

" General settings {{{

    set nocompatible	" Be iMproved, required
    filetype plugin on	" Required
	syntax on			" For C syntax check, change C++11 to C99 in .vim/.ycm_extra_conf.py
    set encoding=utf-8
    set autoread " detect when a file is changed
    set backupdir=~/.vim/tmp/backup//,. " set directory for backup files
    set directory=~/.vim/tmp/swap//,. " ... swap files
    set undodir=~/.vim/tmp/undo//,. " ... and undo files
	set undofile
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
	let @/ = "" " highlight search but not when source .vimrc
    set nolazyredraw " don't redraw while executing macros

    " Apprearance
	colorscheme dracula
	let g:dracula_italic = 0 " Fix Dracula highlight because terminal doesn't support Italic
    set t_Co=256 " explicitly tell vim that the terminal supports 256 colors
    set number relativenumber
    set background=dark
    set shell=$SHELL
    set autoindent " automatically set indent of new line
    set signcolumn=auto " only show signcolumn when there's sign
	set cursorline
    set ttyfast " faster redrawing

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

	" write, compile and execute
	map <F6> :!javac % && java %<<CR>
	"map <F6> :w<CR> :!gcc % -o %< && ./%<<CR>

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

	" Search
	" Highlight
	highlight       Search    ctermfg=Black  ctermbg=208    cterm=bold
	highlight    IncSearch    ctermfg=Black  ctermbg=Red    cterm=bold
	" Center search hit and automatically clear highlight with is.vim
	nmap n <Plug>(is-n)zz
	nmap N <Plug>(is-N)zz

	" Easy Motion
	let g:EasyMotion_do_mapping = 0 " Disable default mappings
	" Jump to anywhere you want with minimal keystrokes, with just one key binding.
	" `<Leader>s{char}{label}`
	"nmap <Leader>s <Plug>(easymotion-overwin-f)
	" or
	" `<Leader>s{char}{char}{label}`
	" Need one more keystroke, but on average, it may be more comfortable.
	nmap <leader>s <Plug>(easymotion-overwin-f2)
	" Turn on case-insensitive feature
	let g:EasyMotion_smartcase = 1
	" JK motions: Line motions
	nmap <Leader>J <Plug>(easymotion-j)
	nmap <Leader>K <Plug>(easymotion-k)

	" Fzf
	nnoremap <silent> <Leader><Leader> :Files<CR>
	nnoremap <silent> <Leader>C        :Colors<CR>
	nnoremap <silent> <Leader><Enter>  :Buffers<CR>
	nnoremap <silent> <Leader>H        :Helptags<CR>
	nnoremap <silent> <Leader>/        :BLines<CR>
	nnoremap <silent> <Leader>?        :Lines<CR>
	nnoremap <silent> <Leader>`        :Marks<CR>
	nnoremap <silent> <Leader>M        :Maps<CR>

	" Mundo
	nnoremap <F5> :MundoToggle<CR>
	let g:mundo_auto_preview_delay=0

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
	let g:rainbow_conf = {'ctermfgs': ['red', 'green', 'cyan', 'magenta']}

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

	" Fzf
	if has('nvim') || has('gui_running')
		let $FZF_DEFAULT_OPTS .= ' --inline-info'
	endif
    let g:fzf_action = {
		\ 'ctrl-t': 'tab split',
		\ 'ctrl-s': 'split',
		\ 'ctrl-v': 'vsplit' }
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" }}}
