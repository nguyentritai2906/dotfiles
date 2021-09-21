" Map leader to space
let mapleader=" "

" Clear all highlight
nnoremap <Leader>ah :noh<CR>

" Keep visual selection when indenting/outdenting/commemt/uncomment
vmap < <gv
vmap > >gv

" Insert blank line
nnoremap <Leader>j mao<Esc>`a
nnoremap <Leader>k maO<Esc>`a

" Go to middle of line
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

" Delete next word after cursor (similar to CTRL-W) in insert mode
inoremap <C-e> <C-o>de

" Tabs navigation
nnoremap <Leader>th gT
nnoremap <Leader>tl gt
nnoremap <Leader>tH :tabfirst<CR>
nnoremap <Leader>tL :tablast<CR>
nnoremap <Leader>tj :-tabmove<CR>
nnoremap <Leader>tk :+tabmove<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tn :TablineTabNew<CR>
nnoremap <Leader>tr :TablineTabRename<Space>

" Buffers navigation
nmap <silent> <TAB> :TablineBufferNext<CR>
nmap <silent> <S-TAB> :TablineBufferPrevious<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reload config
nmap <Leader><CR> :so $MYVIMRC<CR>

" Yank to end of line (not include carriage-return)
nnoremap Y yg_

" Keeping it inplace
nnoremap J mzJ`z

" Undo break points
inoremap <Space> <Space><C-G>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
