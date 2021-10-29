" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    Plug 'rmagatti/goto-preview'

    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'octaltree/cmp-look'
    Plug 'kdheepak/cmp-latex-symbols'
    Plug 'f3fora/cmp-spell'
    Plug 'lukas-reineke/cmp-rg'
    Plug 'andersevenrud/compe-tmux'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-dispatch'

    " Dev
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'goerz/jupytext.vim'
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    Plug 'jpalardy/vim-slime'
    Plug 'metakirby5/codi.vim'
    Plug 'SirVer/ultisnips' | Plug 'nguyentritai2906/vim-snippets'
    Plug 'mjbrownie/swapit' " Swap True-False
    Plug 'rlue/vim-barbaric' " Switch input method
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'mfussenegger/nvim-dap'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'chipsenkbeil/distant.nvim'

    " Syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'

    " Tags
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'nvim-telescope/telescope-project.nvim'
    Plug 'nvim-telescope/telescope-frecency.nvim' | Plug 'tami5/sqlite.lua'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'simnalamburt/vim-mundo'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'steelsojka/pears.nvim'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'simeji/winresizer'
    Plug 'folke/which-key.nvim'
    Plug 'godlygeek/tabular'
    Plug 'kevinhwang91/nvim-bqf'
    Plug 'tpope/vim-obsession'

    " Text object
    Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'kana/vim-textobj-entire'
	Plug 'kana/vim-textobj-indent'
    Plug 'bps/vim-textobj-python'
	Plug 'wellle/targets.vim'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    " UI
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kdheepak/tabline.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'Yggdroot/indentLine'
    Plug 'PeterRincker/vim-searchlight' " Highlight current search match
    Plug 'markonm/traces.vim' " Range, pattern and substitute preview
    Plug 'kshenoy/vim-signature' " Place, toggle and display marks
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Colorschemes
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'sainnhe/edge'
    Plug 'bluz71/vim-nightfly-guicolors'

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
