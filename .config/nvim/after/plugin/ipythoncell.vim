let g:ipython_cell_tag = ['# %%', '#%%', '# <codecell>', '##', '# +']

let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/slime_paste"
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1

" map <Leader>s to start IPython
nnoremap <Leader>is :SlimeSend1 ipython --matplotlib<CR>
" map <Leader>ir to run script
nnoremap <Leader>ir :IPythonCellRun<CR>
" map <Leader>iR to run script and time the execution
nnoremap <Leader>it :IPythonCellRunTime<CR>
" map <Leader>ic to execute the current cell
nnoremap <Leader>ic :IPythonCellExecuteCell<CR>
" map <Leader>iC to execute the current cell and jump to the next cell
nnoremap <Leader>iC :IPythonCellExecuteCellJump<CR>
" map <Leader>il to clear IPython screen
nnoremap <Leader>il :IPythonCellClear<CR>
" map <Leader>ix to close all Matplotlib figure windows
nnoremap <Leader>ix :IPythonCellClose<CR>
" map <Leader>ih to send the current line or current selection to IPython
nmap <Leader>ih <Plug>SlimeLineSend
xmap <Leader>ih <Plug>SlimeRegionSend
" map <Leader>iQ to restart ipython

nnoremap <Leader>ij :IPythonCellNextCell<CR>
nnoremap <Leader>ik :IPythonCellPrevCell<CR>
nnoremap <Leader>iR :IPythonCellRestart<CR>
