-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
            'williamboman/mason.nvim', -- Portable package manager for Neovim
            'williamboman/mason-lspconfig.nvim', -- Bridges mason.nvim with the lspconfig plugin
            -- Autocompletion
            'hrsh7th/nvim-cmp', -- Autocompletion plugin
            'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
            'hrsh7th/cmp-path', -- Path source for nvim-cmp
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-nvim-lua', -- Lua source for nvim-cmp
            'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
            -- Snippets
            'L3MON4D3/LuaSnip', -- Snippets plugin
            'rafamadriz/friendly-snippets', -- Snippet collection (Optional)
            -- UI
            'j-hui/fidget.nvim', -- Useful status updates for LSP
            'onsails/lspkind-nvim', -- Pictograms for LSP
            'ray-x/lsp_signature.nvim', -- Signature help for LSP
            'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', -- Toggle LSP diagnostics
            'folke/neodev.nvim' -- Additional lua config, makes nvim stuff amazing
        }
    }

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    }

    use {
        'p00f/nvim-ts-rainbow', -- Rainbow parentheses
        'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter-
        'kana/vim-textobj-line', -- Select line
        'kana/vim-textobj-entire', -- Select entire buffer
        'kana/vim-textobj-indent', -- "ii" to select current indent level
        'kana/vim-textobj-user', -- Text object plugin (required by others)
        'wellle/targets.vim', -- Additional text objects
        after = 'nvim-treesitter'
    }

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Dev
    use {
        'glacambre/firenvim',
        'mjbrownie/swapit', -- Swap True-False
        run = function()
            vim.fn['firenvim#install'](0)
        end
    }
    use('hanschen/vim-ipython-cell', {ft = 'python'})
    use 'chipsenkbeil/distant.nvim'

    use {
        "zbirenbaum/copilot.lua",
        after = "nvim-lspconfig",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end
    }

    -- Debuger
    use {'mfussenegger/nvim-dap', 'theHamsta/nvim-dap-virtual-text', 'rcarriga/nvim-dap-ui'}

    -- Fuzzy finder - Faster than Telescope - Requires silversearcher-ag
    use {
        'junegunn/fzf',
        'junegunn/fzf.vim',
        run = function()
            vim.fn['fzf#install']()
        end
    }

    -- Make life easier
    use 'nvim-tree/nvim-tree.lua' -- File explorer
    use 'simnalamburt/vim-mundo' -- Undo tree
    use 'windwp/nvim-autopairs' -- Auto close brackets
    use 'tpope/vim-surround' -- Surround text objects
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-eunuch' -- :Delete, :Move, :Rename, :Chmod
    use 'tpope/vim-repeat' -- Enable repeating supported plugin maps with "."
    use 'folke/which-key.nvim' -- Show keybindings
    use 'godlygeek/tabular' -- Align text
    use 'kevinhwang91/nvim-bqf' -- Better quickfix list
    use 'ervandew/supertab' -- Tab completion
    use 'gioele/vim-autoswap' -- No more swap files! TODO
    use 'tpope/vim-obsession' -- Session management
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'preservim/nerdcommenter' -- <leader>cc (or ci, cu) to comment visual regions/lines

    -- UI
    use 'hoob3rt/lualine.nvim' -- Statusline
    use 'kdheepak/tabline.nvim' -- Tabline
    use 'NvChad/nvim-colorizer.lua' -- Color highlighter
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'PeterRincker/vim-searchlight' -- Highlight current search match
    use 'markonm/traces.vim' -- Range, pattern and substitute preview
    use 'kshenoy/vim-signature' -- Place, toggle and display marks
    use 'mhinz/vim-startify' -- Fancy start screen
    use 'ryanoasis/vim-devicons' -- Icons
    use 'nvim-tree/nvim-web-devicons'

    -- Colorschemes
    use {"catppuccin/nvim", as = "catppuccin"} -- Catppuccin
    use 'nguyentritai2906/dark-notify' -- Switch theme based on system theme

    -- Navigation
    use 'easymotion/vim-easymotion' -- Vim motions on speed
    use 'matze/vim-move' -- Move lines and selections up and down
    use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits

    -- Writing
    use 'vimwiki/vimwiki' -- Personal wiki for all your notes
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {"markdown"}
        end,
        ft = {"markdown"}
    })

end)
