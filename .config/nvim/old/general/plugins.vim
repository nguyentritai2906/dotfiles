" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

    " LSP Support
    Plug 'neovim/nvim-lspconfig'
    Plug 'VonHeikemen/lsp-zero.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'onsails/lspkind-nvim'

    "  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets' " Snippet collection (Optional)
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    " Plug 'SirVer/ultisnips' | Plug 'nguyentritai2906/vim-snippets'

    Plug 'ray-x/lsp_signature.nvim'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    Plug 'rmagatti/goto-preview'

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
    Plug 'mjbrownie/swapit' " Swap True-False
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'mfussenegger/nvim-dap'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'chipsenkbeil/distant.nvim'
    Plug 'github/copilot.vim'
    Plug 'simrat39/rust-tools.nvim'

    " Syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'

    " Make life easier
    Plug 'gioele/vim-autoswap' " No more swap files!
    Plug 'nvim-lua/plenary.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'simnalamburt/vim-mundo'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'windwp/nvim-autopairs'
    Plug 'abecodes/tabout.nvim'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter' | Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'folke/which-key.nvim'
    Plug 'godlygeek/tabular'
    Plug 'kevinhwang91/nvim-bqf'
    Plug 'tpope/vim-obsession'
    Plug 'ervandew/supertab'

    " Text object
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-indent'
    Plug 'bps/vim-textobj-python'
   :Plug 'wellle/targets.vim'
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
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'nguyentritai2906/dark-notify'

    " Navigation
    Plug 'easymotion/vim-easymotion' " Vim motions on speed
    Plug 'matze/vim-move' " Move lines and selections up and down
    Plug 'unblevable/quick-scope' " Quick find <char><char> movement
    Plug 'christoomey/vim-tmux-navigator'

    " Writing
    Plug 'vimwiki/vimwiki'
    Plug 'plasticboy/vim-markdown'	" Syntax highlighting, matching rules and mappings Markdown
    Plug 'junegunn/goyo.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    " Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
