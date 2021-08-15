" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_normal_map')

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<VisualBindings>'<CR>

let g:which_key_normal_map =  {}
let g:which_key_visual_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

let g:which_key_normal_map['m'] = [ '<Plug>(easymotion-overwin-f2)'    , 'EasyMotion'         ]
let g:which_key_normal_map['j'] = [ ':mao<Esc>`a'                      , 'NewLineBelow'       ]
let g:which_key_normal_map['k'] = [ ':mao<Esc>`a'                      , 'NewLineAbove'       ]
let g:which_key_normal_map['E'] = [ 'WinResizerStartResize'            , 'ResizeSplits'       ]
let g:which_key_normal_map['K'] = [ '<Cmd>lua vim.lsp.buf.hover()<CR>' , 'ShowDoccumentation' ]

let g:which_key_visual_map['<'] = 'which_key_ignore'
let g:which_key_visual_map['>'] = 'which_key_ignore'

" " Group mappings

" i is for IPythonCell
let g:which_key_normal_map['i'] = {
            \   'name' :   '+Ipython'                         ,
            \   's'    : [ ':SlimeSend1 ipython --matplotlib' , 'Start'           ] ,
            \   'r'    : [ ':IPythonCellRun'                  , 'RunAll'          ] ,
            \   't'    : [ ':IPythonCellRunTime'              , 'RunAndTimeExec'  ] ,
            \   'c'    : [ ':IPythonCellExecuteCell'          , 'ExecCell'        ] ,
            \   'C'    : [ ':IPythonCellExecuteCellJump'      , 'ExecCellGoNext'  ] ,
            \   'l'    : [ ':IPythonCellClear'                , 'ClearScreen'     ] ,
            \   'x'    : [ ':IPythonCellClose'                , 'CloseFigure'     ] ,
            \   'h'    : [ '<Plug>SlimeLineSend'              , 'ExecCurrentLine' ] ,
            \   'R'    : [ ':IPythonCellRestart'              , 'Restart'         ] ,
            \   'j'    : [ ':IPythonCellNextCell'             , 'NextCell'        ] ,
            \   'k'    : [ ':IPythonCellPrevCell'             , 'PrevCell'        ] ,
            \ }

let g:which_key_visual_map['i'] = {
            \   'name' : '+Ipython'                       ,
            \   'h'    : [ '<Plug>SlimeRegionSend'        , 'ExecCurrentSelection' ] ,
            \ }

" c is for NERDCommenter
let g:which_key_normal_map['c'] = {
            \   'name' :   '+Commenter'                   ,
            \   'c'    : [ '<Plug>NERDCommenterComment'   , 'CommentLine'   ] ,
            \   'i'    : [ '<Plug>NERDCommenterInvert'    , 'InvertComment' ] ,
            \   'u'    : [ '<Plug>NERDCommenterUncomment' , 'UncommentLine' ] ,
            \ }

let g:which_key_visual_map['c'] = {
            \   'name' : '+Commenter'                     ,
            \   'c'    : [ '<Plug>NERDCommenterComment'   , 'CommentLines'   ] ,
            \   'i'    : [ '<Plug>NERDCommenterInvert'    , 'InvertComment'  ] ,
            \   'u'    : [ '<Plug>NERDCommenterUncomment' , 'UncommentLines' ] ,
            \ }

" g is for Git
let g:which_key_normal_map['g'] = {
            \   'name' :   '+GitGutter'                   ,
            \   'k'    : [ '<Plug>(GitGutterPrevHunk)'    , 'PrevHunk'    ] ,
            \   'j'    : [ '<Plug>(GitGutterNextHunk)'    , 'NextHunk'    ] ,
            \   'p'    : [ '<Plug>(GitGutterPreviewHunk)' , 'PreviewHunk' ] ,
            \   's'    : [ '<Plug>(GitGutterStageHunk)'   , 'StageHunk'   ] ,
            \   'u'    : [ '<Plug>(GitGutterUndoHunk)'    , 'UndoHunk'    ] ,
            \ }

" w is for VimWiki
let g:which_key_normal_map['w'] = {
            \   'name' :   '+Vimwiki'                  ,
            \   'i'    : [ '<Plug>VimwikiDiaryIndex'   , 'DiaryIndex' ] ,
            \   's'    : [ '<Plug>VimwikiUISelect'     , 'UISelect'   ] ,
            \   't'    : [ '<Plug>VimwikiTabIndex'     , 'TabIndex'   ] ,
            \   'w'    : [ '<Plug>VimwikiIndex'        , 'Index'      ] ,
            \   'd'    : [ '<Plug>VimwikiDeleteFile'   , 'DeleteFile' ] ,
            \   'h'    : [ '<Plug>Vimwiki2HTML'        , 'ToHTML'     ] ,
            \   'hh'   : [ '<Plug>Vimwiki2HTMLBrowse'  , 'HTMLBrowse' ] ,
            \   'n'    : [ '<Plug>VimwikiGoto'         , 'Goto'       ] ,
            \   'r'    : [ '<Plug>VimwikiRenameFile'   , 'RenameFile' ] ,
            \   ' '    : {
                \   'name' :   '+Diary'                              ,
                \   'i'    : [ '<Plug>VimwikiDiaryGenerateLinks'     , 'GenerateLinks'          ] ,
                \   't'    : [ '<Plug>VimwikiTabMakeDiaryNote'       , 'TabMakeNote'            ] ,
                \   'w'    : [ '<Plug>VimwikiMakeDiaryNote'          , 'MakeNote'               ] ,
                \   'y'    : [ '<Plug>VimwikiMakeYesterdayDiaryNote' , 'MakeYesterdayDiaryNote' ] ,
                \   'm'    : [ '<Plug>VimwikiMakeTomorrowDiaryNote'  , 'MakeTomorrowDiaryNote'  ] ,
            \     } ,
            \ }

" " h is for Highlight
" let g:which_key_normal_map['h'] = {
"             \   'name' :   '+Highlight' ,
"             \ }

" " f is for FZF
" let g:which_key_normal_map['f'] = {
"             \   'name' :   '+FZF'                   ,
"             \   'f'    : [ ':Files    ' , 'Files    ' ] ,
"             \   'b'    : [ ':Buffers  ' , 'Buffers  ' ] ,
"             \   'c'    : [ ':Commands ' , 'Commands ' ] ,
"             \   'h'    : [ ':Helptags ' , 'Helptags ' ] ,
"             \   'g'    : [ ':GFiles   ' , 'GFiles   ' ] ,
"             \   'j'    : [ ':JumpToTab' , 'JumpToTab' ] ,
"             \   'm'    : [ ':Maps     ' , 'Maps     ' ] ,
"             \   'r'    : [ ':History  ' , 'History  ' ] ,
"             \   's'    : [ ':Snippets ' , 'Snippets ' ] ,
"             \   't'    : [ ':FZF ~    ' , 'Home     ' ] ,
"             \   '`'    : [ ':Marks    ' , 'Marks    ' ] ,
"             \   '/'    : [ ':BLines   ' , 'BLines   ' ] ,
"             \   '?'    : [ ':Lines    ' , 'Lines    ' ] ,
"             \   '.'    : [ ':Ag       ' , 'Ag       ' ] ,
"             \ }

" f is for Find
let g:which_key_normal_map['f'] = {
            \   'name' :   '+Find'                   ,
            \   'f'    : [ "<Cmd>lua require'telescope.builtin'.find_files()<CR>"                              , 'Files'     ] ,
            \   'c'    : [ "<Cmd>lua require'telescope.builtin'.commands()<CR>"                                , 'Commands'  ] ,
            \   'r'    : [ "<Cmd>lua require'telescope.builtin'.oldfiles({ path_display =  {'shorten'} })<CR>" , 'Recent'    ] ,
            \   'l'    : [ "<Cmd>lua require'telescope.builtin'.live_grep()<CR>"                               , 'Live Grep' ] ,
            \   'm'    : [ "<Cmd>lua require'telescope.builtin'.keymaps()<CR>"                                 , 'Keymaps'   ] ,
            \   'b'    : [ "<Cmd>lua require'telescope.builtin'.buffers()<CR>"                                 , 'Buffers'   ] ,
            \   'h'    : [ "<Cmd>lua require'telescope.builtin'.help_tags()<CR>"                               , 'HelpTags'  ] ,
            \   'g'    : [ "<Cmd>lua require'nv-telescope'.project_files()<CR>"                                , 'GitFiles'  ] ,
            \   'n'    : [ "<Cmd>lua require'nv-telescope'.find_notes()<CR>"                                   , 'Notes'     ] ,
            \   'e'    : [ "<Cmd>lua require'nv-telescope'.file_explorer()<CR>"                                , 'Explorer'  ] ,
            \   ';'    : [ "<Cmd>lua require'telescope.command'.load_command()<CR>"                            , 'Telescope' ] ,
            \   '~'    : [ "<Cmd>lua require'telescope.builtin'.find_files({cwd = '~'})<CR>"                   , 'Files ~' ] ,
            \   '.'    : [ "<Cmd>lua require'nv-telescope'.rg()<CR>"                                           , 'RipGrep'   ] ,
            \ }
<Cmd>lua require'telescope.builtin'.find_files({cwd = '~'})<CR>
" l is for LSP
let g:which_key_normal_map['l'] = {
            \   'name' :   '+LSP'                         ,
            \   'k'    : [ 'LSPSignatureHelp'             , 'SignatureHelp'           ] ,
            \   'd'    : [ 'LSPTypeDefinition'            , 'TypeDefinition'          ] ,
            \   'e'    : [ 'LSPShowLineDiagnostics'       , 'ShowLineDiagnostics'     ] ,
            \   'q'    : [ 'LSPSetLocList'                , 'ListDiagnosticsLocation' ] ,
            \   'r'    : [ 'LSPRename'                    , 'Rename'                  ] ,
            \   'f'    : [ 'LSPFormatting'                , 'Formatting'              ] ,
            \   'v'    : [ 'LSPVirtualTextToggle'         , 'VirtualText'             ] ,
            \   'w'    : {
                \   'name' :   '+Workspace'               ,
                \   'a'    : [ 'LSPAddWorkspaceFolder'    , 'AddWorkspaceFolder'      ] ,
                \   'r'    : [ 'LSPRemoveWorkspaceFolder' , 'RemoveWorkspaceFolder'   ] ,
                \   'l'    : [ 'LSPListWorkspaceFolders'  , 'ListWorkspaceFolders'    ] ,
            \     }                                       ,
            \   'g'    : {
                \   'name' :   '+GoTo'                    ,
                \   'D'    : [ 'LSPDeclaration'           , 'Declaration'             ] ,
                \   'd'    : [ 'LSPDefinition'            , 'Definition'              ] ,
                \   'r'    : [ 'LSPReferences'            , 'References'              ] ,
                \   'i'    : [ 'LSPImplementation'        , 'Implementation'          ] ,
                \   'k'    : [ 'LSPGotoPrev'              , 'PrevDiagnostic'          ] ,
                \   'j'    : [ 'LSPGotoNext'              , 'NextDiagnostic'          ] ,
            \     }                                       ,
            \ }

let g:which_key_normal_map['s'] = {
      \ 'name' : '+Session'  ,
      \ 'c' : [ ':SClose'    , 'CloseSession'  ] ,
      \ 'd' : [ ':SDelete'   , 'DeleteSession' ] ,
      \ 'l' : [ ':SLoad'     , 'LoadSession'   ] ,
      \ 's' : [ ':Startify'  , 'StartPage'     ] ,
      \ 'S' : [ ':SSave'     , 'SaveSession'   ] ,
      \ }

call which_key#register('<Space>', "g:which_key_normal_map")
call which_key#register('<VisualBindings>', "g:which_key_visual_map")

" a is for Actions
let g:which_key_normal_map.a = {
      \ 'name' : '+Actions'       ,
      \ 'c' : [ ':ColorizerToggle' , 'Colorizer'             ] ,
      \ 'h' : [ ':nohl'            , 'NoHighlight'           ] ,
      \ 'l' : [ ':Bracey'          , 'BraceyStartLiveServer' ] ,
      \ 'L' : [ ':BraceyStop'      , 'BraceyStopLiveServer'  ] ,
      \ 'v' : [ ':Codi'            , 'CodiVirtualREPL'       ] ,
      \ 'V' : [ ':Codi!'           , 'CodiVirtualREPLOff'    ] ,
      \ }

" " b is for buffer
" let g:which_key_normal_map.b = {
      " \ 'name' : '+buffer' ,
      " \ '>' : [':BufferMoveNext'        , 'move next'],
      " \ '<' : [':BufferMovePrevious'    , 'move prev'],
      " \ 'b' : [':BufferPick'            , 'pick buffer'],
      " \ 'd' : [':Bdelete'               , 'delete-buffer'],
      " \ 'n' : ['bnext'                  , 'next-buffer'],
      " \ 'p' : ['bprevious'              , 'previous-buffer'],
      " \ '?' : ['Buffers'                , 'fzf-buffer'],
      " \ }


" F is for fold
let g:which_key_normal_map.F = {
    \ 'name': '+Fold'            ,
    \ 'c' : [':foldclose'        , 'close'    ] ,
    \ 'o' : [':foldopen'         , 'open'     ] ,
    \ 'O' : [':set foldlevel=20' , 'OpenAll'  ] ,
    \ 'C' : [':set foldlevel=0'  , 'CloseAll' ] ,
    \ '1' : [':set foldlevel=1'  , 'Level1'   ] ,
    \ '2' : [':set foldlevel=2'  , 'Level2'   ] ,
    \ '3' : [':set foldlevel=3'  , 'Level3'   ] ,
    \ '4' : [':set foldlevel=4'  , 'Level4'   ] ,
    \ '5' : [':set foldlevel=5'  , 'Level5'   ] ,
    \ '6' : [':set foldlevel=6'  , 'Level6'   ]
    \ }

" " G is for gist
" let g:which_key_normal_map.G = {
      " \ 'name' : '+gist' ,
      " \ 'b' : [':Gist -b'                          , 'post gist browser'],
      " \ 'd' : [':Gist -d'                          , 'delete gist'],
      " \ 'e' : [':Gist -e'                          , 'edit gist'],
      " \ 'l' : [':Gist -l'                          , 'list public gists'],
      " \ 's' : [':Gist -ls'                         , 'list starred gists'],
      " \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      " \ 'p' : [':Gist -P'                          , 'post public gist '],
      " \ 'P' : [':Gist -p'                          , 'post private gist '],
      " \ }
      " " \ 'a' : [':Gist -a'                          , 'post gist anon'],

" " l is for language server protocol
" let g:which_key_normal_map.l = {
      " \ 'name' : '+lsp' ,
      " \ 'a' : [':Lspsaga code_action'                , 'code action'],
      " \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
      " \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      " \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
      " \ 'f' : [':LspFormatting'                      , 'format'],
      " \ 'I' : [':LspInfo'                            , 'lsp info'],
      " \ 'v' : [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
      " \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp finder'],
      " \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      " \ 'o' : [':Vista!!'                            , 'outline'],
      " \ 'p' : [':Lspsaga preview_definition'         , 'preview definition'],
      " \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
      " \ 'r' : [':Lspsaga rename'                          , 'rename'],
      " \ 'T' : [':LspTypeDefinition'                  , 'type defintion'],
      " \ 'x' : [':cclose'                             , 'close quickfix'],
      " \ 's' : [':Telescope lsp_document_symbols'     , 'document symbols'],
      " \ 'S' : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
      " \ }
      " " \ 'H' : [':Lspsaga signature_help'             , 'signature_help'],

" " t is for terminal
" let g:which_key_normal_map.t = {
      " \ 'name' : '+terminal' ,
      " \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      " \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      " \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      " \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      " \ 'n' : [':FloatermNew node'                              , 'node'],
      " \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      " \ 'p' : [':FloatermNew python'                            , 'python'],
      " \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      " \ 't' : [':FloatermToggle'                                , 'toggle'],
      " \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      " \ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],
      " \ }
      " " \ 'r' : [':FloatermNew ranger'                            , 'ranger'],

" let g:which_key_normal_map.R = {
      " \ 'name' : '+Find_Replace' ,
      " \ 'f' : [':Farr --source=vimgrep'    , 'file'],
      " \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      " \ }
