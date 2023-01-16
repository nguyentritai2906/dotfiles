-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            'neovim/nvim-lspconfig', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', -- Autocompletion
            'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind-nvim', 'L3MON4D3/LuaSnip', -- Snippets
            'rafamadriz/friendly-snippets', -- Snippet collection (Optional)
            'j-hui/fidget.nvim', -- Useful status updates for LSP
            'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing
            'ray-x/lsp_signature.nvim'
        }
    }

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        'p00f/nvim-ts-rainbow', -- Rainbow parentheses
        after = 'nvim-treesitter'
    }

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    -- use 'tpope/vim-dispatch'
    -- use 'airblade/vim-gitgutter'

    -- Dev
    use {
        'glacambre/firenvim',
        'mjbrownie/swapit', -- Swap True-False
        run = function()
            vim.fn['firenvim#install'](0)
        end
    }
    use('hanschen/vim-ipython-cell', {ft = 'python'})
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'chipsenkbeil/distant.nvim'
    use 'github/copilot.vim'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

    -- use 'mjbrownie/swapit' -- Swap True-False

    -- Syntax
    -- use 'sheerun/vim-polyglot'

    -- Fuzzy finder - Faster than Telescope - Requires silversearcher-ag
    use {
        'junegunn/fzf',
        run = function()
            vim.fn['fzf#install']()
        end
    }
    use 'junegunn/fzf.vim'

    -- Make life easier
    use 'kyazdani42/nvim-tree.lua' -- File explorer
    use 'simnalamburt/vim-mundo' -- Undo tree
    use 'windwp/nvim-autopairs' -- Auto close brackets
    use 'tpope/vim-surround' -- Surround text objects
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-eunuch' -- :Delete, :Move, :Rename, :Chmod
    use 'tpope/vim-repeat' -- Enable repeating supported plugin maps with "."
    use 'folke/which-key.nvim' -- Show keybindings
    use 'godlygeek/tabular' -- Align text
    use 'kevinhwang91/nvim-bqf' -- Better quickfix list
    use 'ervandew/supertab' -- Tab completion
    use 'gioele/vim-autoswap' -- No more swap files! TODO
    -- use 'tpope/vim-obsession'
    -- use 'preservim/nerdcommenter'
    -- use 'tpope/vim-commentary'

    -- Text object
    use 'kana/vim-textobj-line' -- Select line
    use 'kana/vim-textobj-entire' -- Select entire buffer
    use 'kana/vim-textobj-indent' -- "ii" to select current indent level
    use 'kana/vim-textobj-user'
    use 'wellle/targets.vim' -- Additional text objects

    -- UI
    use 'hoob3rt/lualine.nvim' -- Statusline
    use 'kdheepak/tabline.nvim' -- Tabline
    use 'NvChad/nvim-colorizer.lua' -- Color highlighter
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'PeterRincker/vim-searchlight' -- Highlight current search match
    use 'markonm/traces.vim' -- Range, pattern and substitute preview
    use 'kshenoy/vim-signature' -- Place, toggle and display marks
    use 'mhinz/vim-startify' -- Fancy start screen
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'Yggdroot/indentLine'

    -- Colorschemes
    use 'sainnhe/edge'
    use 'bluz71/vim-nightfly-guicolors'
    use {"catppuccin/nvim", as = "catppuccin"}
    use 'nguyentritai2906/dark-notify' -- Switch theme based on system theme

    -- Navigation
    use 'easymotion/vim-easymotion' -- Vim motions on speed
    use 'matze/vim-move' -- Move lines and selections up and down
    use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits

    -- Writing
    use 'vimwiki/vimwiki'
    use('iamcco/markdown-preview.nvim', {run = 'cd app && yarn install'})
    use 'plasticboy/vim-markdown' -- Syntax highlighting, matching rules and mappings Markdown
    -- use 'plasticboy/vim-markdown' -- Syntax highlighting, matching rules and mappings Markdown

end)
