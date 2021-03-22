" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Turn off sign column highlight
let g:gitgutter_override_sign_column_highlight = 1

let g:gitgutter_map_keys = 0
nmap <space>gp <Plug>(GitGutterPrevHunk)
nmap <space>gn <Plug>(GitGutterNextHunk)
nmap <space>gv <Plug>(GitGutterPreviewHunk)
nmap <space>gs <Plug>(GitGutterStageHunk)
nmap <space>gu <Plug>(GitGutterUndoHunk)
