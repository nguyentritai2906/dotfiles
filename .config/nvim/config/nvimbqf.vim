hi default link BqfPreviewFloat Normal
hi default link BqfPreviewBorder Normal
hi default link BqfPreviewCursor Cursor
hi default link BqfPreviewRange Search
hi default BqfSign ctermfg=14 guifg=Cyan

" :h CocLocationsChange for detail
let g:coc_enable_locationlist = 0
aug Coc
    au!
    au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END

" if you use coc-fzf, you should disable its CocLocationsChange event make
" bqf work for <Plug>(coc-references)
au VimEnter * au! CocFzfLocation User CocLocationsChange
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>qd <Cmd>call Coc_qf_diagnostic()<CR>

function! Coc_qf_diagnostic() abort
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
        let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
                    \ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
        let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
                    \ d.severity[0]}
        call add(loc_ranges, d.location.range)
        call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
        aboveleft lwindow
    else
        call win_gotoid(winid)
    endif
endfunction

lua <<EOF
require('bqf').setup({
    filter = {
        fzf = {
            action_for = {
                ['ctrl-t'] = {
                    description = [[press ctrl-t to open up the item in a new tab]],
                    default = 'tabedit'
                },
                ['ctrl-v'] = {
                    description = [[press ctrl-v to open up the item in a new vertical split]],
                    default = 'vsplit'
                },
                ['ctrl-s'] = {
                    description = [[press ctrl-x to open up the item in a new horizontal split]],
                    default = 'split'
                },
                ['ctrl-q'] = {
                    description = [[press ctrl-q to toggle sign for the selected items]],
                    default = 'signtoggle'
                },
            },
            extra_opts = {
                description = 'extra options for fzf',
                default = {'--bind', 'ctrl-o:toggle-all'}
            }
        }
    }
})
EOF
