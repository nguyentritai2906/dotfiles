" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    " LSP
    " {{{
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-compe'
        Plug 'ray-x/lsp_signature.nvim'
        Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    " }}}
    " {{{
        " Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " " Add maktaba and codefmt to the runtimepath.
        " " (The latter must be installed before it can be used.)
        " Plug 'google/vim-maktaba'
        " Plug 'google/vim-codefmt'
        " " Also add Glaive, which is used to configure codefmt's maktaba flags. See
        " " `:help :Glaive` for usage.
        " Plug 'google/vim-glaive'
        " Plug 'ervandew/supertab'
    " }}}

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
    Plug 'mjbrownie/swapit' " Swap True-False
    Plug 'rlue/vim-barbaric' " Switch input method

    " Syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'

    " Tags
    Plug 'majutsushi/tagbar'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    " Plug '~/.fzf' | Plug 'junegunn/fzf.vim' | Plug 'ojroques/nvim-lspfuzzy'
    Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'simnalamburt/vim-mundo'
    Plug 'luochen1990/rainbow' | Plug 'p00f/nvim-ts-rainbow' | Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'simeji/winresizer'
    " Plug 'liuchengxu/vim-which-key'
    Plug 'folke/which-key.nvim'
    Plug 'godlygeek/tabular'
    Plug 'kevinhwang91/nvim-bqf'

    " Text object
    Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'kana/vim-textobj-entire'
	Plug 'kana/vim-textobj-indent'
    Plug 'bps/vim-textobj-python'
	Plug 'wellle/targets.vim'

    " UI
    Plug 'hoob3rt/lualine.nvim'
    " Plug 'romgrk/barbar.nvim'
    Plug 'kdheepak/tabline.nvim'
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
    Plug 'machakann/vim-highlightedyank'

    " Colorschemes
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'sainnhe/edge'

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
