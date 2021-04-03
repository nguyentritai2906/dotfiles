" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-dispatch'

    " Dev
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'godlygeek/tabular'
    Plug 'goerz/jupytext.vim'
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'jpalardy/vim-slime'
    Plug 'sheerun/vim-polyglot'
    Plug 'stevearc/vim-arduino'
    Plug 'turbio/bracey.vim'
    Plug 'metakirby5/codi.vim'

    " Tags
    Plug 'majutsushi/tagbar' " Vim plugin that displays tags in a window
    Plug 'xolox/vim-easytags' " Automated tag file generation and syntax highlighting of tags in Vim
    Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts, required for xolox's pluggin

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim' " General-purpose command-line fuzzy finder vim integration
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'kyazdani42/nvim-tree.lua' " A tree explorer plugin for vim
    Plug 'simnalamburt/vim-mundo' " Graph vim undo tree
    Plug 'jiangmiao/auto-pairs' " Autopair parentheses and stuff
    Plug 'luochen1990/rainbow' " Rainbow parentheses
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary' " Easy comment out lines of codes
    Plug 'tpope/vim-surround' " Change parentheses and stuff with ease
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line' | Plug 'kana/vim-textobj-entire'
    Plug 'danro/rename.vim'
    Plug 'tpope/vim-repeat'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-abolish'
    Plug 'simeji/winresizer'
    Plug 'szw/vim-maximizer'
    Plug 'liuchengxu/vim-which-key'

    " UI
    Plug 'vim-airline/vim-airline' " Lean & mean tabline for vim
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'sainnhe/edge'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'Yggdroot/indentLine' " Display indentation level
    Plug 'haya14busa/is.vim' " Incremental search improved
    Plug 'PeterRincker/vim-searchlight' " Highlight current search match
    Plug 'markonm/traces.vim' " Range, pattern and substitute preview
    Plug 'osyo-manga/vim-anzu' " Search status
    Plug 'kshenoy/vim-signature' " Place, toggle and display marks
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Navigation
    Plug 'easymotion/vim-easymotion' " Vim motions on speed
    Plug 'matze/vim-move' " Move lines and selections up and down
    Plug 'unblevable/quick-scope' " Quick find <char><char> movement
    Plug 'christoomey/vim-tmux-navigator'

    " Writing
    Plug 'vimwiki/vimwiki'
    Plug 'plasticboy/vim-markdown'	" Syntax highlighting, matching rules and mappings Markdown
    Plug 'SirVer/ultisnips' | Plug 'nguyentritai2906/vim-snippets'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
