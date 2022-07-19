source ~/.config/nvim/config/edge.vim
" colorscheme catppuccin

" Highlight
highlight		Normal		guibg=NONE	 ctermbg=NONE
highlight         link      Searchlight  IncSearch

" Add DONE to TODO highlighting group
" https://stackoverflow.com/questions/4162664/vim-highlight-a-list-of-words
match Todo /DONE\|NOTE\|TODO/
