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

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
augroup END
