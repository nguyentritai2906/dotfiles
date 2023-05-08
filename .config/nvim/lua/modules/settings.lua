vim.cmd("filetype plugin indent on")
vim.o.syntax = "on"
vim.o.encoding = "utf-8"
vim.o.autoread = true
vim.o.undofile = true
vim.o.title = true
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 100
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 0
vim.o.conceallevel = 2
vim.o.wildmode = "longest,full"
vim.o.completeopt = "menu,menuone,noinsert,noselect,preview"
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal,globals"
vim.o.wildcharm = vim.fn.char2nr('	')
vim.o.dictionary = "/usr/share/dict/words"
vim.g.vimsyn_embed = "lPr"

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildignorecase = true
vim.o.hlsearch = true
vim.o.lazyredraw = true

-- Appearance
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 5
vim.o.splitright = true

if vim.fn.has("termguicolors") == 1 then vim.o.termguicolors = true end

-- Tab control
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.breakindent = true
vim.cmd("let @/ = ''")

vim.cmd [[ set listchars=tab:»\ ,trail:·,nbsp:␣,extends:❯,precedes:❮,eol:↵ ]]
vim.opt.list = true
