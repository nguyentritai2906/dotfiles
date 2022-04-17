au BufEnter guvpccig.labs.coursera.org_*.txt set filetype=python
au BufEnter colab.research.google.com_*.txt set filetype=python
au BufEnter *.labs.coursera.org_*.txt set filetype=python
au BufEnter localhost*.txt set filetype=python

function! s:IsFirenvimActive(event) abort
    if !exists('*nvim_get_chan_info')
        return 0
    endif
    let l:ui = nvim_get_chan_info(a:event.chan)
    return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
                \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
    if s:IsFirenvimActive(a:event)
        set laststatus=0
        set guifont=Hack\ Nerd\ Font\ Regular:h15
        set completeopt=menuone,noselect
        highlight MyGroup gui=bold
        match MyGroup /./

        call timer_start(100, function("Adapt_To_Height_Timer"))
        au InsertLeave * call Adapt_To_Height()
    endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

let g:firenvim_config = {
            \ 'globalSettings': {
            \ 'alt': 'all',
            \  },
            \ 'localSettings': {
            \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
            \ },
            \ }
            \ }
" let fc = g:firenvim_config['localSettings']
" let fc['https?://guvpccig.labs.coursera.org/'] = { 'takeover': 'always', 'priority': 1 }

function! Buf_Height()
    let win_width = nvim_win_get_width(0) + 0.0
    let lines = nvim_buf_get_lines(0, 0, -1, v:false)
    let buf_height = 0
    for line in lines
        let buf_height = buf_height + 1 + floor(len(line) / win_width)
    endfor
    return buf_height
endfunction

function! Adapt_To_Height()
    let buf_height = Buf_Height()
    if buf_height > 4
        execute("set lines=" . float2nr(buf_height+2))
    else
        set lines=6
    endif
endfunction

function! Adapt_To_Height_Timer(timer)
    call Adapt_To_Height()
endfunction
