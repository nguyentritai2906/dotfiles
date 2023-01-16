nmap <F7> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1
            \&& exists("b:NERDTree")
            \&& b:NERDTree.isTabTree()) | q | endif
