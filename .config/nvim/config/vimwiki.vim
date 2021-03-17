" From https://dev.to/konstantin/taking-notes-with-vim-3619
let g:vimwiki_list = [{'path': '$HOME/Documents/notes/',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'links_space_char': '-'}]
let g:vimwiki_auto_header = 1
" let g:vimwiki_folding = 'custom'
let g:vimwiki_table_mappings = 0
let g:vimwiki_filetypes = ['markdown']

" Set foldmethod in Vimwiki
" autocmd BufEnter *.md setlocal foldmethod=indent
