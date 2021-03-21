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

" 29
command! LSPCodeAction lua require 'nv-utils'.code_action()
command! LSPDeclaration lua require 'nv-utils'.declaration()
command! LSPDefinition lua require 'nv-utils'.definition()
command! LSPDocumentSymbol lua require 'nv-utils'.document_symbol()
command! LSPFormatting lua require 'nv-utils'.formatting()
command! LSPFormattingSync lua require 'nv-utils'.formatting_sync()
command! LSPHover lua require 'nv-utils'.hover()
command! LSPImplementation lua require 'nv-utils'.implementation()
command! LSPRangeCodeAction lua require 'nv-utils'.range_code_action()
command! LSPRangeFormatting lua require 'nv-utils'.range_formatting()
command! LSPReferences lua require 'nv-utils'.references()
command! LSPRename lua require 'nv-utils'.rename()
command! LSPTypeDefinition lua require 'nv-utils'.type_definition()
command! LSPWorkspaceSymbol lua require 'nv-utils'.workspace_symbol()
command! LSPGotoNext lua require 'nv-utils'.goto_next()
command! LSPGotoPrev lua require 'nv-utils'.goto_prev()
command! LSPShowLineDiagnostics lua require 'nv-utils'.show_line_diagnostics()
command! LSPSignatureHelp lua require 'nv-utils'.signature_help()
command! LSPSetLocList lua require 'nv-utils'.set_loclist()
command! LSPAddWorkspaceFolder lua require 'nv-utils'.add_workspace_folder()
command! LSPRemoveWorkspaceFolder lua require 'nv-utils'.remove_workspace_folder()
command! LSPListWorkspaceFolders lua require 'nv-utils'.list_workspace_folders()
command! W noa w
