let g:coc_config_home = '~/.config/nvim/plug-config/'

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! GoCoc()
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Coc scroll popup
    nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
    nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

    " Use <Leader-D> to show documentation in preview window.
    nnoremap <silent> <Leader>D :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocActionAsync('doHover')
        endif
    endfunction

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " GoTo code navigation.
    nmap <buffer> <silent> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <silent> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <silent> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <silent> <leader>gr <Plug>(coc-references)
    nmap <buffer> <silent> <leader>gj <Plug>(coc-diagnostic-next)
    nmap <buffer> <silent> <leader>gk <Plug>(coc-diagnostic-prev)
    nmap <buffer> <silent> <leader>gej <Plug>(coc-diagnostic-next-error)
    nmap <buffer> <silent> <leader>gek <Plug>(coc-diagnostic-prev-error)
    nmap <buffer> <silent> <leader>rn <Plug>(coc-rename)
    nnoremap <buffer> <leader>cr :CocRestart
endfunction

autocmd Filetype java,c,cpp,cxx,h,hpp,html,css,python :call GoCoc()
