" Visual selection of indent level
function SelectIndent()
    let cur_line = line(".")
    let cur_ind = indent(cur_line)
    let line = cur_line
    while indent(line - 1) >= cur_ind
        let line = line - 1
    endw
    exe "normal " . line . "G"
    exe "normal V"
    let line = cur_line
    while indent(line + 1) >= cur_ind
        let line = line + 1
    endw
    exe "normal " . line . "G"
endfunction

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
