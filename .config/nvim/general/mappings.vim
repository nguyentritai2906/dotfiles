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
nnoremap th gT
nnoremap tl gt
nnoremap tH :tabfirst<CR>
nnoremap tL :tablast<CR>
nnoremap tj :-tabmove<CR>
nnoremap tk :+tabmove<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<SPACE>

" Buffers navigation
nmap <silent> <TAB> :bnext<CR>
nmap <silent> <S-TAB> :bprev<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick config related actions
nmap confr :so $MYVIMRC<CR>
nmap confe :e $MYVIMRC<CR>

