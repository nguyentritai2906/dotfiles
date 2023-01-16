" Search mode
function s:SearchMode()
    nunmap n
    nunmap N
    if !exists('s:searchmode') || s:searchmode == 0
        echo 'SearchMode: Maybe'
        nmap <silent> n  <Plug>(is-n):call <SID>MaybeMiddle()<CR>
        nmap <silent> N  <Plug>(is-N):call <SID>MaybeMiddle()<CR>
        nmap <silent> *  <Plug>(is-*):call <SID>MaybeMiddle()<CR>
        nmap <silent> #  <Plug>(is-#):call <SID>MaybeMiddle()<CR>
        nmap <silent> g* <Plug>(is-g*):call <SID>MaybeMiddle()<CR>
        nmap <silent> g# <Plug>(is-g#):call <SID>MaybeMiddle()<CR>
        let s:searchmode = 1
    elseif s:searchmode == 1
        echo 'SearchMode: Middle'
        nmap <silent> n  <Plug>(is-n)zz
        nmap <silent> N  <Plug>(is-N)zz
        nmap <silent> *  <Plug>(is-*)zz
        nmap <silent> #  <Plug>(is-#)zz
        nmap <silent> g* <Plug>(is-g*)zz
        nmap <silent> g# <Plug>(is-g#)zz
        let s:searchmode = 2
    else
        echo 'SearchMode: Normal'
        nmap <silent> n  <Plug>(is-n)
        nmap <silent> N  <Plug>(is-N)
        nmap <silent> *  <Plug>(is-*)
        nmap <silent> #  <Plug>(is-#)
        nmap <silent> g* <Plug>(is-g*)
        nmap <silent> g# <Plug>(is-g#)
        let s:searchmode = 0
    endif
endfunction

" If cursor is in first or last line of window, scroll to middle line.
function s:MaybeMiddle()
    if winline() == 1 || winline() == winheight(0)
        normal! zz
    endif
endfunction

" Write with no autocmds
command! W noa w

" Better alternative for autochdir
" autocmd BufEnter * silent! lcd %:p:h
function ChangeDirCurBuf()
    execute 'lcd %:p:h'
    execute 'pwd'
endfunction
nnoremap <silent> <Leader>lcd :call ChangeDirCurBuf()<CR>

