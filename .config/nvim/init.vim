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

" Configuration
source ~/.config/nvim/config/easymotion.vim
source ~/.config/nvim/config/firenvim.vim
source ~/.config/nvim/config/fugitive.vim
source ~/.config/nvim/config/gitgutter.vim
source ~/.config/nvim/config/indentline.vim
source ~/.config/nvim/config/ipythoncell.vim
source ~/.config/nvim/config/jupytext.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/mundo.vim
source ~/.config/nvim/config/nerdcommenter.vim
source ~/.config/nvim/config/nvimcolorizer.vim
source ~/.config/nvim/config/nvimtree.vim
source ~/.config/nvim/config/quickscope.vim
source ~/.config/nvim/config/slime.vim
source ~/.config/nvim/config/startify.vim
source ~/.config/nvim/config/ultisnips.vim
source ~/.config/nvim/config/vimmove.vim
source ~/.config/nvim/config/vimwiki.vim
source ~/.config/nvim/config/winresize.vim

lua require('plenary.reload').reload_module('modules', true)
lua require('modules.lsp')
lua require('modules.lsp.efm-ls')
lua require('modules.lsp.bash-ls')
lua require('modules.lsp.pyright-ls')
lua require('modules.cmp')
lua require('modules.treesitter')
lua require('modules.telescope')
lua require('modules.whichkey')
lua require('modules.lualine')
lua require('modules.tabline')
lua require('modules.dap')
lua require('modules.distant')
lua require('modules.others')
