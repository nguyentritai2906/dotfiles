" ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
"   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝



" Plugin {{{

    call plug#begin('~/.vim/plugged')

    " Dev
    " Plug 'Valloric/YouCompleteMe' " Ycm code-suggestion engine
        " Installed YouCompleteMe with both 'libclang' and 'clangd' enabled. In that case 'clangd' will
        " be preferred unless you have the following
        " let g:ycm_use_clangd = 0
        " YCM semantic completion to automatically trigger after typing two characters
        let g:ycm_semantic_triggers =  {
                    \   'c': ['->', '.'],
                    \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                    \            're!\[.*\]\s'],
                    \   'ocaml': ['.', '#'],
                    \   'cpp,cuda,objcpp': ['->', '.', '::'],
                    \   'perl': ['->'],
                    \   'php': ['->', '::'],
                    \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.', 're!\w{2}'],
                    \   'ruby,rust': ['.', '::'],
                    \   'lua': ['.', ':'],
                    \   'erlang': [':'],
                    \ }
        " Make YCM compatible with UltiSnips (using <Tab> through Supertab)
        let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
        " Trigger completion for C
        let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
        let g:ycm_show_diagnostics_ui = 1
        " Populate vims location list with new diagnostic data
        " Use :lnext and :lprev - Jump to next or previous error in list
        let g:ycm_always_populate_location_list = 1
        " let g:ycm_autoclose_preview_window_after_completion=1
        " let g:ycm_autoclose_preview_window_after_insertion=1
        let g:ycm_min_num_of_chars_for_completion = 1
        let g:lsp_ultisnips_integration = 1
        " let g:loaded_youcompleteme = 1 " Disable on start up
         let g:ycm_filetype_blacklist = {
                    \ 'gitcommit': 1,
                    \ 'vim': 1,
                    \ 'c' : 1,
                    \ 'cpp' : 1,
                    \ 'cxx' : 1,
                    \ 'h' : 1,
                    \ 'hpp' : 1,
                    \ 'html' : 1,
                    \ 'css' : 1,
                    \ 'text' : 1,
                    \}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'
        let g:ale_completion_enabled = 0
        " Check Python files with flake8 and pylint.
        let g:ale_linters = {'python': ['flake8', 'pylint']}
        " Fix Python files with black, isort, yapf.
        let g:ale_fixers = {
                    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                    \ 'python': ['black', 'isort', 'yapf', 'autopep8'],
                    \ 'html': ['tidy', 'prettier'],
                    \ }
        let g:ale_fix_on_save = 1
        let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
        let g:prettier#quickfix_enabled = 0
        autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml PrettierAsync
    Plug 'airblade/vim-gitgutter' " Git diff, stages/undoes hunks and partial hunks
        " Use fontawesome icons as signs
        let g:gitgutter_sign_added = '+'
        let g:gitgutter_sign_modified = '>'
        let g:gitgutter_sign_removed = '-'
        let g:gitgutter_sign_removed_first_line = '^'
        let g:gitgutter_sign_modified_removed = '<'
        " Turn off sign column highlight
        let g:gitgutter_override_sign_column_highlight = 1
    Plug 'tpope/vim-fugitive' " Git wrapper
    Plug 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = '<C-n>'

    " Tags
    Plug 'majutsushi/tagbar' " Vim plugin that displays tags in a window
    Plug 'universal-ctags/ctags' " Universal tags for codes
        "Install Exuberant Ctags 'sudo eopkg it ctags' which is a dependency
        "To build with Autotools, see docs/autotools.rst for more information
    Plug 'xolox/vim-easytags' " Automated tag file generation and syntax highlighting of tags in Vim
    Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts, required for xolox's pluggin
    Plug 'turbio/bracey.vim'
        let g:bracey_refresh_on_save = 1

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim' " General-purpose command-line fuzzy finder vim integration
        let g:fzf_action = {
                    \ 'ctrl-t': 'tab split',
                    \ 'ctrl-s': 'split',
                    \ 'ctrl-v': 'vsplit' }
        let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.6}}
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }
        let g:fzf_buffers_jump = 1
    Plug 'preservim/nerdtree' " A tree explorer plugin for vim
    Plug 'simnalamburt/vim-mundo' " Graph vim undo tree
        let g:mundo_auto_preview_delay=0
        let g:mundo_inline_undo=1
    Plug 'jiangmiao/auto-pairs' " Autopair parentheses and stuff
        let g:AutoPairsFlyMode = 1
        " For why using F22 hack see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
        let g:AutoPairsShortcutBackInsert = '<A-m>'
    Plug 'luochen1990/rainbow' " Rainbow parentheses
        let g:rainbow_active = 1    " Enable vim-rainbow globally
        let g:rainbow_conf = {
                    \ 'ctermfgs': ['red', 'green', 'cyan', 'magenta'],
                    \ 'separately': {
                    \ 'markdown': {'parentheses_options': 'containedin=markdownCode contained',},
                    \ 'vimwiki': {'parentheses_options': 'containedin=vimwikiCode contained',},
                    \ 'vim': {'parentheses_options': 'containedin=vimFuncBody',},
                    \ }}
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary' " Easy comment out lines of codes
        let g:NERDCreateDefaultMappings = 0
        let g:NERDSpaceDelims = 1
        let g:NERDRemoveExtraSpaces = 1
    Plug 'tpope/vim-surround' " Change parentheses and stuff with ease
    Plug 'christoomey/vim-titlecase'
        let g:titlecase_map_keys = 0
        nmap <leader>gt <Plug>Titlecase
        vmap <leader>gt <Plug>Titlecase
        nmap <leader>gT <Plug>TitlecaseLine
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire'
    Plug 'danro/rename.vim'
    Plug 'tpope/vim-repeat'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-abolish'
    Plug 'simeji/winresizer'

    " UI
    Plug 'vim-airline/vim-airline' " Lean & mean tabline for vim
    Plug 'morhetz/gruvbox' " GruvBox colorscheme
    Plug 'joshdick/onedark.vim' " OneDark colorscheme
    Plug 'dracula/vim', { 'as': 'dracula'  } " GruvBox colorscheme
    Plug 'lilydjwg/colorizer' " Colorize all text in form of #rrggbb and #rgb
    Plug 'Yggdroot/indentLine' " Display indentation level
        let g:indentLine_fileTypeExclude = ['markdown', 'vimwiki']
    Plug 'haya14busa/is.vim' " Incremental search improved
        let g:incsearch#auto_nohlsearch = 1
    Plug 'PeterRincker/vim-searchlight' " Highlight current search match
    Plug 'machakann/vim-highlightedyank' " Just like it's name
        let g:highlightedyank_highlight_duration = 100
    Plug 'markonm/traces.vim' " Range, pattern and substitute preview
    Plug 'osyo-manga/vim-anzu' " Search status
        let g:anzu_status_format = "[%i/%l]"
    " Plug 'severin-lemaignan/vim-minimap'
    Plug 'kshenoy/vim-signature' " Place, toggle and display marks
    Plug 'junegunn/limelight.vim'
        " Color name (:help cterm-colors) or ANSI code
        let g:limelight_conceal_ctermfg = 'gray'
        let g:limelight_conceal_ctermfg = 240
        " Color name (:help gui-colors) or RGB color
        let g:limelight_conceal_guifg = 'DarkGray'
        let g:limelight_conceal_guifg = '#777777'
        " Highlighting priority (default: 10)
        "   Set it to -1 not to overrule hlsearch
        let g:limelight_priority = -1

        " Per paragraph {{{
            " Number of preceding/following paragraphs to include (default: 0)
            " let g:limelight_paragraph_span = 1
            " Beginning/end of paragraph
            "   When there's no empty line between the paragraphs
            "   and each paragraph starts with indentation
            " let g:limelight_bop = '^\s'
            " let g:limelight_eop = '\ze\n^\s'
        " }}}

        " Per line {{{
            let g:limelight_bop = '^.*$'
            let g:limelight_eop = '\n'
        " }}}
    Plug 'junegunn/goyo.vim'
        let g:goyo_linenr = 1
        let g:goyo_width = 81

    " Navigation
    Plug 'easymotion/vim-easymotion' " Vim motions on speed
        let g:EasyMotion_do_mapping = 0 " Disable default mappings
        let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
    Plug 'matze/vim-move' " Move lines and selections up and down
    Plug 'unblevable/quick-scope' " Quick find <char> movement
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    " Writing
    Plug 'vimwiki/vimwiki'
        " From https://dev.to/konstantin/taking-notes-with-vim-3619
        let g:vimwiki_list = [{'path': '$HOME/Documents/notes/',
                    \ 'syntax': 'markdown', 'ext': '.md',
                    \ 'links_space_char': '-'}]
        let g:vimwiki_auto_header = 1
        let g:vimwiki_folding= 'custom'
        let g:vimwiki_table_mappings=0
    Plug 'plasticboy/vim-markdown'	" Syntax highlighting, matching rules and mappings Markdown
        let g:vim_markdown_no_default_key_mappings = 1
        let g:vim_markdown_folding_disabled = 1
    Plug 'SirVer/ultisnips' | Plug 'nguyentritai2906/vim-snippets'
        let g:UltiSnipsExpandTrigger = "<C-j>"
        let g:UltiSnipsJumpForwardTrigger = "<C-j>"
        let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

    call plug#end()

" }}}

" Settings {{{

    set nocompatible " Be iMproved, required
    filetype plugin indent on " https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
    syntax on " For C syntax check, change C++11 to C99 in .vim/.ycm_extra_conf.py
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
    set mouse=nv

    " Searching
    set incsearch " lookahead as search pattern is specified
    set ignorecase " ignore case in all searches...
    set smartcase " unless uppercase letters used
    set wildignorecase " Command line completion ignore case
    set hlsearch " highlight all matches
    let @/ = "" " highlight search but not when source .vimrc
    set nolazyredraw " don't redraw while executing macros
    set tags=tags;/ " Check current folder for tags file and keep going one directory up all the way to the root folder

    " Apprearance
    "colorscheme gruvbox
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

" }}}

" Mapping {{{

    " Map leader to space
    let mapleader=" "

    " " Remap ESC
    " inoremap ii <ESC>
    " vnoremap ii <ESC>
    " cnoremap ii <ESC>

    " Clear all highlight
    nnoremap <Leader>hl :noh<CR>

    " Keep visual selection when indenting/outdenting/commemt/uncomment
    vmap < <gv
    vmap > >gv

    " Write, compile and execute
    autocmd filetype python nnoremap <buffer> <F6> :w<CR> :te  python3 ./%<CR>
    autocmd filetype java nnoremap <buffer> <F6> :te java %<<CR>
    autocmd filetype c,cpp nnoremap <buffer> <F6> :te ./%<<CR>
    autocmd filetype java nnoremap <buffer> <Leader><F6> :w<CR> :!javac %<CR>
    autocmd filetype c,cpp nnoremap <buffer> <Leader><F6> :w<CR> :!gcc % -o %<<CR>

    " Visual selection of indent level
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

    " Insert blank line
    nnoremap <Leader>j mao<Esc>`a
    nnoremap <Leader>k maO<Esc>`a

    nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

    " Navigate between tab
    nnoremap th gT
    nnoremap tl gt
    nnoremap tH :tabfirst<CR>
    nnoremap tL :tablast<CR>
    nnoremap tj :-tabmove<CR>
    nnoremap tk :+tabmove<CR>
    nnoremap tc :tabclose<CR>
    nnoremap tn :tabnew<SPACE>

    " Make the 81st column stand out
    " IMPORTANT: load the colorscheme before ctermbg settings in .vimrc
    " because they need to override the same ones set by the colorscheme.
    highlight ColorColumn ctermbg=darkcyan
    call matchadd('ColorColumn', '\%81v', 100)

    " Search {{{
        " Highlight
        highlight		Normal		guibg=NONE	 ctermbg=NONE
        highlight         link      Searchlight  IncSearch
        "highlight       Search    ctermfg=Black  ctermbg=208    cterm=bold
        "highlight  Searchlight    ctermfg=Black  ctermbg=196    cterm=bold
        "highlight    IncSearch    ctermfg=Black  ctermbg=196    cterm=bold

        "highlight link VimwikiHeader1 GruvBoxRed
        "highlight link VimwikiHeader2 GruvBoxGreen
        "highlight link VimwikiHeader3 GruvBoxBlue
        "highlight link VimwikiHeader4 GruvBoxPurple
        "highlight link VimwikiHeader5 GruvBoxAqua
        "highlight link VimwikiHeader6 GruvBoxYellow

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
        " Is.Vim
        nmap <silent> *  <Plug>(is-*)zz
        nmap <silent> #  <Plug>(is-#)zz
        nmap <silent> g* <Plug>(is-g*)zz
        nmap <silent> g# <Plug>(is-g#)zz
        " Search mode
        function s:SearchMode()
            nunmap n
            nunmap N
            if !exists('s:searchmode') || s:searchmode == 0
                echo 'SearchMode: Maybe'
                nmap <silent> n  <Plug>(is-n):call <SID>MaybeMiddle()<CR>
                nmap <silent> N  <Plug>(is-N):call <SID>MaybeMiddle()<CR>
                nmap <silent> *  <Plug>(is-*):call <SID>MaybeMiddle()<CR>
                nmap <silent> #  <Plug>(is-#):call <SID>MaybeMiddle()<CR>
                nmap <silent> g* <Plug>(is-g*):call <SID>MaybeMiddle()<CR>
                nmap <silent> g# <Plug>(is-g#):call <SID>MaybeMiddle()<CR>
                let s:searchmode = 1
            elseif s:searchmode == 1
                echo 'SearchMode: Middle'
                nmap <silent> n  <Plug>(is-n)zz
                nmap <silent> N  <Plug>(is-N)zz
                nmap <silent> *  <Plug>(is-*)zz
                nmap <silent> #  <Plug>(is-#)zz
                nmap <silent> g* <Plug>(is-g*)zz
                nmap <silent> g# <Plug>(is-g#)zz
                let s:searchmode = 2
            else
                echo 'SearchMode: Normal'
                nmap <silent> n  <Plug>(is-n)
                nmap <silent> N  <Plug>(is-N)
                nmap <silent> *  <Plug>(is-*)
                nmap <silent> #  <Plug>(is-#)
                nmap <silent> g* <Plug>(is-g*)
                nmap <silent> g# <Plug>(is-g#)
                let s:searchmode = 0
            endif
        endfunction
        " If cursor is in first or last line of window, scroll to middle line.
        function s:MaybeMiddle()
            if winline() == 1 || winline() == winheight(0)
                normal! zz
            endif
        endfunction
    " }}}

    " Easy Motion
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    "nmap <Leader>s <Plug>(easymotion-overwin-f)
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap <Leader><Leader> <Plug>(easymotion-overwin-f2)
    " Line motions
    nmap <Leader>J <Plug>(easymotion-j)
    nmap <Leader>K <Plug>(easymotion-k)

    " Fzf {{{
        if has('nvim') || has('gui_running')
            let $FZF_DEFAULT_OPTS .= ' --inline-info'
        endif
        nnoremap <silent> <Leader>/        :BLines<CR>
        nnoremap <silent> <Leader><CR>     :Files<CR>
        nnoremap <silent> <Leader>?        :Lines<CR>
        nnoremap <silent> <Leader>B        :Buffers<CR>
        nnoremap <silent> <Leader>C        :Colors<CR>
        nnoremap <silent> <Leader>H        :Helptags<CR>
        nnoremap <silent> <Leader>J        :JumpToTab<CR>
        nnoremap <silent> <Leader>M        :Maps<CR>
        nnoremap <silent> <Leader>R        :History<CR>
        nnoremap <silent> <Leader>S        :Snippets<CR>
        nnoremap <silent> <Leader>T        :FZF ~<CR>
        nnoremap <silent> <Leader>`        :Marks<CR>
        nnoremap <silent> <leader>.        :Ag<CR>
        nnoremap <silent> K                :call SearchWordWithAg()<CR>
        vnoremap <silent> K                :call SearchVisualSelectionWithAg()<CR>

        " Jump to tab
        " Source get a list of strings whose format is ['tabNumber tabName']
        " JumpToTab receives the selected item,
        " Get the tab number using split()
        " And then execute command ':normal #gt'
        function TabName(n)
            let buflist = tabpagebuflist(a:n)
            let winnr = tabpagewinnr(a:n)
            return fnamemodify(bufname(buflist[winnr - 1]), ':t')
        endfunction

        function! s:JumpToTab(line)
            let pair = split(a:line, ' ')
            let cmd = pair[0].'gt'
            execute 'normal' cmd
        endfunction

        command! JumpToTab call fzf#run(fzf#wrap({
                    \   'source':  map(range(1, tabpagenr('$')),
                    \   'v:val." "." ".TabName(v:val)'),
                    \   'sink':    function('<SID>JumpToTab'),
                    \   }))

        function! SearchWordWithAg()
            execute 'Ag' expand('<cword>')
        endfunction

        function! SearchVisualSelectionWithAg() range
            let old_reg = getreg('"')
            let old_regtype = getregtype('"')
            let old_clipboard = &clipboard
            set clipboard&
            normal! ""gvy
            let selection = getreg('"')
            call setreg('"', old_reg, old_regtype)
            let &clipboard = old_clipboard
            execute 'Ag' selection
        endfunction

        " Default options are --nogroup --column --color
        let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case '

        command! -bang -nargs=* Ag
                    \ call fzf#vim#ag(
                    \   <q-args>,
                    \   s:ag_options,
                    \  <bang>0 ? fzf#vim#with_preview('up:60%')
                    \        : fzf#vim#with_preview('right:50%:hidden', '?'),
                    \   <bang>0
                    \ )
    " }}}

    " Mundo
    nnoremap <F5> :MundoToggle<CR>

    " NERDCommenter
    vmap <Leader>cc <Plug>NERDCommenterComment
    nmap <Leader>cc <Plug>NERDCommenterComment
    vmap <Leader>cu <Plug>NERDCommenterUncomment
    nmap <Leader>cu <Plug>NERDCommenterUncomment
    vmap <Leader>ci <Plug>NERDCommenterInvert
    nmap <Leader>ci <Plug>NERDCommenterInvert

    " NERDtree and Tagbar
    nmap <F8> :TagbarToggle<CR>
    nmap <F7> :NERDTreeToggle<CR>
    "nnoremap <F9> :TagbarToggle<CR> :NERDTreeToggle<CR>

    " Vim-Move
    vmap <A-j> <Plug>MoveBlockDown
    vmap <A-k> <Plug>MoveBlockUp
    nmap <A-j> <Plug>MoveLineDown
    nmap <A-k> <Plug>MoveLineUp

    " ALE
    nmap <silent> <leader>aj :ALENext<CR>
    nmap <silent> <leader>ak :ALEPrevious<CR>

    " WinResize
    " If you want to start window resize mode by `Leader+E`
    let g:winresizer_start_key="<Leader>E"


" }}}

" AutoGroups {{{

    " Automatically VimResized
    autocmd VimResized * wincmd =

    " Make Vim open help in a vertical split
    augroup vimrc_help
        autocmd!
        autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | set number relativenumber | endif
    augroup END

    " Completion engines configuration to use COC in conjunction with YCM
    " function! GoYCM()
    "     " let g:loaded_youcompleteme = 0
    "     nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    "     nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    "     nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
    "     set completeopt-=preview
    " endfunction

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    function! GoCoc()
        " Use tab for trigger completion with characters ahead and navigate.
        " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
        " other plugin before putting this into your config.
        inoremap <buffer> <silent><expr> <TAB>
                    \ pumvisible() ? "\<C-n>" :
                    \ <SID>check_back_space() ? "\<TAB>" :
                    \ coc#refresh()
        inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
        " position. Coc only does snippet and additional edit on confirm.
        " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
        if exists('*complete_info')
            inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        else
            inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        endif

        " Coc scroll popup
        nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
        nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

        " Use <Leader-D> to show documentation in preview window.
        nnoremap <silent> <Leader>D :call <SID>show_documentation()<CR>
        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocActionAsync('doHover')
            endif
        endfunction

        " Add `:Format` command to format current buffer.
        command! -nargs=0 Format :call CocAction('format')
        " Add `:Fold` command to fold current buffer.
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)
        " Add `:OR` command for organize imports of the current buffer.
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Highlight the symbol and its references when holding the cursor.
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " GoTo code navigation.
        nmap <buffer> <silent> <leader>gd <Plug>(coc-definition)
        nmap <buffer> <silent> <leader>gy <Plug>(coc-type-definition)
        nmap <buffer> <silent> <leader>gi <Plug>(coc-implementation)
        nmap <buffer> <silent> <leader>gr <Plug>(coc-references)
        nmap <buffer> <silent> <leader>gj <Plug>(coc-diagnostic-next)
        nmap <buffer> <silent> <leader>gk <Plug>(coc-diagnostic-prev)
        nmap <buffer> <silent> <leader>gej <Plug>(coc-diagnostic-next-error)
        nmap <buffer> <silent> <leader>gek <Plug>(coc-diagnostic-prev-error)
        nnoremap <buffer> <leader>cr :CocRestart
    endfunction

    " autocmd Filetype java,typescript,rust,go :call GoYCM()
    " autocmd BufNew,BufEnter *.java,*.ts,*.rs,*.go execute "silent! CocDisable"
    " autocmd BufLeave *.java,*.ts,*.rs,*.go execute "silent! CocEnable"
    " autocmd Filetype c,cpp,cxx,h,hpp,html,css,python :call GoCoc()

    autocmd Filetype java,c,cpp,cxx,h,hpp,html,css,python :call GoCoc()

    "NERDTree
    " Open NERDTree automatically when vim starts up if no files were specified
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Close vim if the only window left open is a NERDTree
    autocmd BufEnter * if (winnr("$") == 1
                \&& exists("b:NERDTree")
                \&& b:NERDTree.isTabTree()) | q | endif

    " " Multiple Cursors
    " " Experimentally integrate YouCompleteMe with vim-multiple-cursors, otherwise
    " " the numerous Cursor events cause great slowness
    " " (https://github.com/kristijanhusak/vim-multiple-cursors/issues/4)
    " function Multiple_cursors_before()
    "     let s:old_ycm_whitelist = g:ycm_filetype_whitelist
    "     let g:ycm_filetype_whitelist = {}
    " endfunction
    " function Multiple_cursors_after()
    "     let g:ycm_filetype_whitelist = s:old_ycm_whitelist
    " endfunction

    " Remove trailing whilespace
    autocmd BufWritePre * %s/\s\+$//e

    " Set foldmethod in Vimwiki
    autocmd BufEnter *.md setlocal foldmethod=indent

    " Terminal settings
    " Enter insert mode automatically
    autocmd TermOpen * startinsert

    " Preserve last editing position
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " Load the version of matchit.vim that ships with Vim
    runtime! macros/matchit.vim

    " Better alternative for autochdir
    autocmd BufEnter * silent! lcd %:p:h

    " Goyo issue with transparency
    " https://github.com/junegunn/goyo.vim/issues/224
    function! s:goyo_leave()
            hi Normal guibg=NONE ctermbg=NONE
    endfunction
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
