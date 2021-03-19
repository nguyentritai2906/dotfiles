source ~/.config/nvim/config/edge.vim
colorscheme edge

" Spell underline
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal

" Highlight
highlight		Normal		guibg=NONE	 ctermbg=NONE
highlight         link      Searchlight  IncSearch

" Add DONE to TODO highlighting group
" https://stackoverflow.com/questions/4162664/vim-highlight-a-list-of-words
match Todo /DONE\|NOTE/
