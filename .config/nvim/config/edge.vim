" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'neon'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 0
let g:edge_sign_column_background = 'none'
let g:edge_transparent_background = 1
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
