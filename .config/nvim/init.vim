" ███╗   ██╗██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗
" ████╗  ██║██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝
" ██╔██╗ ██║██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝



" General
source ~/.config/nvim/general/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/general/mappings.vim
source ~/.config/nvim/general/autocmds.vim
source ~/.config/nvim/general/colorschemes.vim

" Configs
source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/anzu.vim
source ~/.config/nvim/config/arduino.vim
source ~/.config/nvim/config/autopairs.vim
source ~/.config/nvim/config/bracey.vim
source ~/.config/nvim/config/easymotion.vim
source ~/.config/nvim/config/firenvim.vim
source ~/.config/nvim/config/fugitive.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/gitgutter.vim
source ~/.config/nvim/config/incsearch.vim
source ~/.config/nvim/config/indentline.vim
source ~/.config/nvim/config/ipythoncell.vim
source ~/.config/nvim/config/jupytext.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/mundo.vim
source ~/.config/nvim/config/nerdcommenter.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/nvimcolorizer.vim
source ~/.config/nvim/config/nvimtree.vim
source ~/.config/nvim/config/quickscope.vim
source ~/.config/nvim/config/rainbow.vim
source ~/.config/nvim/config/slime.vim
source ~/.config/nvim/config/startify.vim
source ~/.config/nvim/config/tagbar.vim
source ~/.config/nvim/config/ultisnips.vim
source ~/.config/nvim/config/vimmove.vim
source ~/.config/nvim/config/vimmultiplecursors.vim
source ~/.config/nvim/config/vimwiki.vim
source ~/.config/nvim/config/virtualenv.vim
source ~/.config/nvim/config/winresize.vim
source ~/.config/nvim/config/whichkey.vim

lua require('nv-lsp')
lua require('nv-lsp.efm-ls')
lua require('nv-compe')
lua require('nv-utils')
lua require('nv-treesitter')
