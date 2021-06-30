let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.6}}
let g:fzf_colors =
            \ { 'fg'    : ['fg', 'Normal'],
            \ 'bg'      : ['bg', 'Normal'],
            \ 'hl'      : ['fg', 'Comment'],
            \ 'fg+'     : ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+'     : ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+'     : ['fg', 'Statement'],
            \ 'info'    : ['fg', 'PreProc'],
            \ 'border'  : ['fg', 'Ignore'],
            \ 'prompt'  : ['fg', 'Conditional'],
            \ 'pointer' : ['fg', 'Exception'],
            \ 'marker'  : ['fg', 'Keyword'],
            \ 'spinner' : ['fg', 'Label'],
            \ 'header'  : ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1

if has('nvim') || has('gui_running')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
    " let $FZF_DEFAULT_OPTS .= ' --inline-info --preview-window=:nohidden'
endif
nnoremap <silent> <Leader>f/ : BLines<CR>
nnoremap <silent> <Leader>f? : Lines<CR>
nnoremap <silent> <Leader>ff : Files<CR>
nnoremap <silent> <Leader>fb : Buffers<CR>
nnoremap <silent> <Leader>fc : Commands<CR>
nnoremap <silent> <Leader>fh : Helptags<CR>
nnoremap <silent> <Leader>fg : GFiles<CR>
nnoremap <silent> <Leader>fj : JumpToTab<CR>
nnoremap <silent> <Leader>fm : Maps<CR>
nnoremap <silent> <Leader>fr : History<CR>
nnoremap <silent> <Leader>fs : Snippets<CR>
nnoremap <silent> <Leader>ft : FZF ~<CR>
nnoremap <silent> <Leader>f` : Marks<CR>
nnoremap <silent> <leader>f. : Ag<CR>
nnoremap <silent> <leader>fT : Tags<CR>
" nnoremap <silent> K          : call SearchWordWithAg()<CR>
vnoremap <silent> K          : call SearchVisualSelectionWithAg()<CR>

" Jump to tab
" Source get a list of strings whose format is ['tabNumber tabName']
" JumpToTab receives the selected item,
" Get the tab number using split()
" And then execute command ':normal #gt'
function TabName(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

function! s:JumpToTab(line)
    let pair = split(a:line, ' ')
    let cmd = pair[0].'gt'
    execute 'normal' cmd
endfunction

command! JumpToTab call fzf#run(fzf#wrap({
            \   'source':  map(range(1, tabpagenr('$')),
            \   'v:val." "." ".TabName(v:val)'),
            \   'sink':    function('<SID>JumpToTab'),
            \   }))

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

" Default options are --nogroup --column --color
let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case '

" command! -bang -nargs=* Ag
"             \ call fzf#vim#ag(
"             \   <q-args>,
"             \   s:ag_options,
"             \  <bang>0 ? fzf#vim#with_preview('up:60%')
"             \        : fzf#vim#with_preview('right:50%:hidden', '?'),
"             \   <bang>0
"             \ )

command! -bang -nargs=* Ag
            \ call AgGrepWrap(<q-args>, <bang>0)

function! AgAddHLPattern(timer) abort
    " At most cases, we only select signle item
    " check whether the quick window is opened
    if getqflist({'winid' : 0}).winid != 0
        call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': getreg('/')}}})
    endif
endfunction

function! AgGrepWrap(grep_command, bang) abort
    " TODO grep_command maybe grep regex, please refer vim-grepper's handler
    call setreg('/', a:grep_command)
    exe printf('au FileType fzf ++once exe "%s"',
                \ "au BufWipeout <buffer> call timer_start(0, 'AgAddHLPattern')")

    call fzf#vim#ag(
                \ a:grep_command,
                \ s:ag_options,
                \ a:bang ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
                \        : fzf#vim#with_preview('right:50%:hidden', '?'),
                \ a:bang
                \ )
endfunction

