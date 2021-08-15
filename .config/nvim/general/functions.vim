" " Visual selection of indent level
" function SelectIndent()
"     let cur_line = line(".")
"     let cur_ind = indent(cur_line)
"     let line = cur_line
"     while indent(line - 1) >= cur_ind
"         let line = line - 1
"     endw
"     exe "normal " . line . "G"
"     exe "normal V"
"     let line = cur_line
"     while indent(line + 1) >= cur_ind
"         let line = line + 1
"     endw
"     exe "normal " . line . "G"
" endfunction

" " Visual select block of indented lines
" nnoremap vil :call SelectIndent()<CR>


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

" 29
command! LSPCodeAction lua require 'modules.utils'.code_action()
command! LSPDeclaration lua require 'modules.utils'.declaration()
command! LSPDefinition lua require 'modules.utils'.definition()
command! LSPDocumentSymbol lua require 'modules.utils'.document_symbol()
command! LSPFormatting lua require 'modules.utils'.formatting()
command! LSPFormattingSync lua require 'modules.utils'.formatting_sync()
command! LSPHover lua require 'modules.utils'.hover()
command! LSPImplementation lua require 'modules.utils'.implementation()
command! LSPRangeCodeAction lua require 'modules.utils'.range_code_action()
command! LSPRangeFormatting lua require 'modules.utils'.range_formatting()
command! LSPReferences lua require 'modules.utils'.references()
command! LSPRename lua require 'modules.utils'.rename()
command! LSPTypeDefinition lua require 'modules.utils'.type_definition()
command! LSPWorkspaceSymbol lua require 'modules.utils'.workspace_symbol()
command! LSPGotoNext lua require 'modules.utils'.goto_next()
command! LSPGotoPrev lua require 'modules.utils'.goto_prev()
command! LSPShowLineDiagnostics lua require 'modules.utils'.show_line_diagnostics()
command! LSPSignatureHelp lua require 'modules.utils'.signature_help()
command! LSPSetLocList lua require 'modules.utils'.set_loclist()
command! LSPAddWorkspaceFolder lua require 'modules.utils'.add_workspace_folder()
command! LSPRemoveWorkspaceFolder lua require 'modules.utils'.remove_workspace_folder()
command! LSPListWorkspaceFolders lua require 'modules.utils'.list_workspace_folders()
command! W noa w
