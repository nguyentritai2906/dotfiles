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

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-dispatch'

    " Dev
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'goerz/jupytext.vim'
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'jpalardy/vim-slime'
    Plug 'turbio/bracey.vim'
    Plug 'metakirby5/codi.vim'
    Plug 'SirVer/ultisnips' | Plug 'nguyentritai2906/vim-snippets'

    " Syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'

    " Tags
    Plug 'majutsushi/tagbar'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    Plug '~/.fzf' | Plug 'junegunn/fzf.vim' | Plug 'ojroques/nvim-lspfuzzy'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'simnalamburt/vim-mundo'
    Plug 'luochen1990/rainbow' | Plug 'jiangmiao/auto-pairs' | Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'simeji/winresizer'
    Plug 'liuchengxu/vim-which-key'
    Plug 'godlygeek/tabular'

    " Text object
    Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'kana/vim-textobj-entire'
	Plug 'wellle/targets.vim'
    Plug 'michaeljsmith/vim-indent-object'

    " UI
    Plug 'vim-airline/vim-airline'
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'sainnhe/edge'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'Yggdroot/indentLine'
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

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
