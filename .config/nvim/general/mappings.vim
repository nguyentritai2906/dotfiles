" Map leader to space
let mapleader=" "

" Clear all highlight
nnoremap <Leader>hl :noh<CR>

" Keep visual selection when indenting/outdenting/commemt/uncomment
vmap < <gv
vmap > >gv

nnoremap vil :call SelectIndent()<CR>

" Insert blank line
nnoremap <Leader>j mao<Esc>`a
nnoremap <Leader>k maO<Esc>`a

" Go to middle of line
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

" Delete next word after cursor (similar to CTRL-W) in insert mode
inoremap <C-e> <C-o>de

" Navigate between tab
nnoremap th gT
nnoremap tl gt
nnoremap tH :tabfirst<CR>
nnoremap tL :tablast<CR>
nnoremap tj :-tabmove<CR>
nnoremap tk :+tabmove<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<SPACE>

nmap <leader>so :so ~/.config/nvim/init.vim<CR>
