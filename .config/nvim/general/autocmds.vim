" Write, compile and execute
autocmd filetype python nnoremap <buffer> <F6> :w<CR> :te  python3 ./%<CR>
autocmd filetype java nnoremap <buffer> <F6> :te java %<<CR>
autocmd filetype c,cpp nnoremap <buffer> <F6> :te ./%<<CR>
autocmd filetype java nnoremap <buffer> <Leader><F6> :w<CR> :!javac %<CR>
autocmd filetype c,cpp nnoremap <buffer> <Leader><F6> :w<CR> :!gcc % -o %<<CR>

" Automatically VimResized
autocmd VimResized * wincmd =

" Make Vim open help in a vertical split
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | set number relativenumber | endif
augroup END

" Remove trailing whilespace
autocmd BufWritePre * %s/\s\+$//e

" Terminal settings
" Enter insert mode automatically
autocmd TermOpen * startinsert

" Preserve last editing position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Load the version of matchit.vim that ships with Vim
runtime! macros/matchit.vim

" Better alternative for autochdir
autocmd BufEnter * silent! lcd %:p:h
