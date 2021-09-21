require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<CR>"] = "RET",
        ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 2, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 35 }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local wk = require("which-key")

wk.register({
    i = {
        name =   "+Ipython"                         ,
        s    = { ":SlimeSend1 ipython --matplotlib<CR>" , "Start"           } ,
        r    = { ":IPythonCellRun<CR>"                  , "RunAll"          } ,
        t    = { ":IPythonCellRunTime<CR>"              , "RunAndTimeExec"  } ,
        c    = { ":IPythonCellExecuteCell<CR>"          , "ExecCell"        } ,
        C    = { ":IPythonCellExecuteCellJump<CR>"      , "ExecCellGoNext"  } ,
        l    = { ":IPythonCellClear<CR>"                , "ClearScreen"     } ,
        x    = { ":IPythonCellClose<CR>"                , "CloseFigure"     } ,
        h    = { "<Plug>SlimeLineSend"              , "ExecCurrentLine" } ,
        R    = { ":IPythonCellRestart<CR>"              , "Restart"         } ,
        j    = { ":IPythonCellNextCell<CR>"             , "NextCell"        } ,
        k    = { ":IPythonCellPrevCell<CR>"             , "PrevCell"        } ,
        h    = { "<Plug>SlimeRegionSend"            , "ExecCurrentSelection", mode = "v" } ,
    },
    c = {
        name =   "+Commenter"                   ,
        c    = { "<Plug>NERDCommenterComment"   , "CommentLine"   } ,
        i    = { "<Plug>NERDCommenterInvert"    , "InvertComment" } ,
        u    = { "<Plug>NERDCommenterUncomment" , "UncommentLine" } ,
    },
    g = {
        name =   "+GitGutter"                   ,
        k    = { "<Plug>(GitGutterPrevHunk)"    , "PrevHunk"    } ,
        j    = { "<Plug>(GitGutterNextHunk)"    , "NextHunk"    } ,
        p    = { "<Plug>(GitGutterPreviewHunk)" , "PreviewHunk" } ,
        s    = { "<Plug>(GitGutterStageHunk)"   , "StageHunk"   } ,
        u    = { "<Plug>(GitGutterUndoHunk)"    , "UndoHunk"    } ,
    },
    w = {
        name =   "+Vimwiki"                  ,
        i    = { "<Plug>VimwikiDiaryIndex"   , "DiaryIndex" } ,
        s    = { "<Plug>VimwikiUISelect"     , "UISelect"   } ,
        t    = { "<Plug>VimwikiTabIndex"     , "TabIndex"   } ,
        w    = { "<Plug>VimwikiIndex"        , "Index"      } ,
        d    = { "<Plug>VimwikiDeleteFile"   , "DeleteFile" } ,
        h    = { "<Plug>Vimwiki2HTML"        , "ToHTML"     } ,
        hh   = { "<Plug>Vimwiki2HTMLBrowse"  , "HTMLBrowse" } ,
        n    = { "<Plug>VimwikiGoto"         , "Goto"       } ,
        r    = { "<Plug>VimwikiRenameFile"   , "RenameFile" } ,
        ["<space>"]    = {
            name =   "+Diary"                              ,
            i    = { "<Plug>VimwikiDiaryGenerateLinks"     , "GenerateLinks"          } ,
            t    = { "<Plug>VimwikiTabMakeDiaryNote"       , "TabMakeNote"            } ,
            w    = { "<Plug>VimwikiMakeDiaryNote"          , "MakeNote"               } ,
            y    = { "<Plug>VimwikiMakeYesterdayDiaryNote" , "MakeYesterdayDiaryNote" } ,
            m    = { "<Plug>VimwikiMakeTomorrowDiaryNote"  , "MakeTomorrowDiaryNote"  } ,
        } ,
    },
    f = {
        name =   "+Find"                   ,
        f    = { "<cmd>lua require'telescope.builtin'.find_files()<CR>", "Files"     } ,
        c    = { "<cmd>lua require'telescope.builtin'.commands()<CR>", "Commands"  } ,
        r    = { "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Recent"    } ,
        l    = { "<cmd>lua require'telescope.builtin'.live_grep()<CR>", "Live Grep" } ,
        k    = { "<cmd>lua require'telescope.builtin'.keymaps()<CR>", "Keymaps"   } ,
        b    = { "<cmd>lua require'telescope.builtin'.buffers()<CR>", "Buffers"   } ,
        h    = { "<cmd>lua require'telescope.builtin'.help_tags()<CR>", "Help Tags"  } ,
        g    = { "<cmd>lua require'modules.telescope'.project_files()<CR>", "Git Files"  } ,
        n    = { "<cmd>lua require'modules.telescope'.find_notes()<CR>", "Notes"     } ,
        e    = { "<cmd>lua require'telescope.builtin'.file_browser({ hidden = true })<CR>", "Explorer"  } ,
        E    = { "<cmd>lua require'modules.telescope'.file_explorer()<CR>", "Explorer ~"  } ,
        F    = { "<cmd>lua require'modules.telescope'.find_home()<CR>", "Files ~" } ,
        p    = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" } ,
        K    = { "<cmd>lua require'telescope.builtin'.grep_string()<CR>", "Grep CWord" } ,
        m    = { "<cmd>lua require'telescope.builtin'.marks()<CR>", "Marks" } ,
        C    = { "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", "Clipboard" } ,
        [";"]    = { "<cmd>lua require'telescope.command'.load_command()<CR>", "Telescope" } ,
        ["."]    = { "<cmd>lua require'modules.telescope'.rg()<CR>", "Rip Grep"   } ,
        ["/"]    = { "<cmd>lua require'modules.telescope'.nvim_config()<CR>", "Nvim Config"   } ,
    },
    l = {
        name =   "+LSP"                         ,
        k    = { ":LSPSignatureHelp<CR>"             , "SignatureHelp"           } ,
        d    = { ":LSPTypeDefinition<CR>"            , "TypeDefinition"          } ,
        e    = { ":LSPShowLineDiagnostics<CR>"       , "ShowLineDiagnostics"     } ,
        E    = { ":ToggleDiagText<CR>"               , "ToggleDiagnostic"        } ,
        q    = { ":LSPSetLocList<CR>"                , "ListDiagnosticsLocation" } ,
        r    = { ":LSPRename<CR>"                    , "Rename"                  } ,
        f    = { ":LSPFormatting<CR>"                , "Formatting"              } ,
        v    = { ":LSPVirtualTextToggle<CR>"         , "VirtualText"             } ,
        w    = {
            name =   "+Workspace"               ,
            a    = { ":LSPAddWorkspaceFolder<CR>"    , "AddWorkspaceFolder"      } ,
            r    = { ":LSPRemoveWorkspaceFolder<CR>" , "RemoveWorkspaceFolder"   } ,
            l    = { ":LSPListWorkspaceFolders<CR>"  , "ListWorkspaceFolders"    } ,
        },
        g    = {
            name =   "+GoTo"                    ,
            D    = { ":LSPDeclaration<CR>"           , "Declaration"             } ,
            d    = { ":LSPDefinition<CR>"            , "Definition"              } ,
            r    = { ":LSPReferences<CR>"            , "References"              } ,
            i    = { ":LSPImplementation<CR>"        , "Implementation"          } ,
            k    = { ":LSPGotoPrev<CR>"              , "PrevDiagnostic"          } ,
            j    = { ":LSPGotoNext<CR>"              , "NextDiagnostic"          } ,
        },
    },
    s = {
        name = "+Session"  ,
        c = { ":SClose<CR>"    , "CloseSession"  } ,
        d = { ":SDelete<CR>"   , "DeleteSession" } ,
        l = { ":SLoad<CR>"     , "LoadSession"   } ,
        s = { ":Startify<CR>"  , "StartPage"     } ,
        S = { ":SSave<CR>"     , "SaveSession"   } ,
        o = { ":Obsession<CR>"     , "TrackSession"   } ,
        O = { ":Obsession!<CR>"     , "StopTrackSession"   } ,
    },
    a = {
        name = "+Actions"       ,
        c = { ":ColorizerToggle<CR>" , "Colorizer"             } ,
        h = { ":nohl<CR>"            , "NoHighlight"           } ,
        l = { ":Bracey<CR>"          , "BraceyStartLiveServer" } ,
        L = { ":BraceyStop<CR>"      , "BraceyStopLiveServer"  } ,
        v = { ":Codi<CR>"            , "CodiVirtualREPL"       } ,
        V = { ":Codi!<CR>"           , "CodiVirtualREPLOff"    } ,
    },
    ["<space>"] = {"<Plug>(easymotion-overwin-f2)", "Easy Motion"},
    ["<cr>"] = {" :so $MYVIMRC<CR>", "Source Config"},
    j = {"mao<Esc>`a", "Newline Below"},
    k = {"maO<Esc>`a", "Newline Above"},
    E = {":WinResizerStartResize<CR>", "Resize"},
    t = {
        name = "+Tab",
        h = {"gT"                      , "TabLeft"},
        l = {"gt"                      , "TabRight"},
        H = {":tabfirst<CR>"           , "TabFirst"},
        L = {":tablast<CR>"            , "TabLast"},
        j = {":-tabmove<CR>"           , "TabMoveLeft"},
        k = {":+tabmove<CR>"           , "TabMoveRight"},
        c = {":tabclose<CR>"           , "TabClose"},
        n = {":TablineTabNNew<Space>"  , "TabNew"},
        r = {":TablineTabRename<Space>", "TabRename"},
    },
},
{
    prefix = "<Leader>"
})
