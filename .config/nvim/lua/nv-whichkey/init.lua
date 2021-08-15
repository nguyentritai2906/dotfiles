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
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
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
            s    = { ":SlimeSend1 ipython --matplotlib" , "Start"           } ,
            r    = { ":IPythonCellRun"                  , "RunAll"          } ,
            t    = { ":IPythonCellRunTime"              , "RunAndTimeExec"  } ,
            c    = { ":IPythonCellExecuteCell"          , "ExecCell"        } ,
            C    = { ":IPythonCellExecuteCellJump"      , "ExecCellGoNext"  } ,
            l    = { ":IPythonCellClear"                , "ClearScreen"     } ,
            x    = { ":IPythonCellClose"                , "CloseFigure"     } ,
            h    = { "<Plug>SlimeLineSend"              , "ExecCurrentLine" } ,
            R    = { ":IPythonCellRestart"              , "Restart"         } ,
            j    = { ":IPythonCellNextCell"             , "NextCell"        } ,
            k    = { ":IPythonCellPrevCell"             , "PrevCell"        } ,
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
            f    = { "<Cmd>lua require'telescope.builtin'.find_files()<CR>", "Files"     } ,
            c    = { "<Cmd>lua require'telescope.builtin'.commands()<CR>", "Commands"  } ,
            r    = { "<Cmd>lua require'telescope.builtin'.oldfiles({ path_display =  {'shorten'} })<CR>", "Recent"    } ,
            l    = { "<Cmd>lua require'telescope.builtin'.live_grep()<CR>", "Live Grep" } ,
            m    = { "<Cmd>lua require'telescope.builtin'.keymaps()<CR>", "Keymaps"   } ,
            b    = { "<Cmd>lua require'telescope.builtin'.buffers()<CR>", "Buffers"   } ,
            h    = { "<Cmd>lua require'telescope.builtin'.help_tags()<CR>", "HelpTags"  } ,
            g    = { "<Cmd>lua require'nv-telescope'.project_files()<CR>", "GitFiles"  } ,
            n    = { "<Cmd>lua require'nv-telescope'.find_notes()<CR>", "Notes"     } ,
            e    = { "<Cmd>lua require'nv-telescope'.file_explorer()<CR>", "Explorer"  } ,
            [";"]    = { "<Cmd>lua require'telescope.command'.load_command()<CR>", "Telescope" } ,
            ["~"]    = { "<Cmd>lua require'telescope.builtin'.find_files({cwd = '~'})<CR>", "Files ~" } ,
            ["."]    = { "<Cmd>lua require'nv-telescope'.rg()<CR>", "RipGrep"   } ,
            ["/"]    = { "<Cmd>lua require'nv-telescope'.nvim_config()<CR>", "Nvim Config"   } ,
        },
        l = {
            name =   "+LSP"                         ,
            k    = { "LSPSignatureHelp"             , "SignatureHelp"           } ,
            d    = { "LSPTypeDefinition"            , "TypeDefinition"          } ,
            e    = { "LSPShowLineDiagnostics"       , "ShowLineDiagnostics"     } ,
            q    = { "LSPSetLocList"                , "ListDiagnosticsLocation" } ,
            r    = { "LSPRename"                    , "Rename"                  } ,
            f    = { "LSPFormatting"                , "Formatting"              } ,
            v    = { "LSPVirtualTextToggle"         , "VirtualText"             } ,
            w    = {
                name =   "+Workspace"               ,
                a    = { "LSPAddWorkspaceFolder"    , "AddWorkspaceFolder"      } ,
                r    = { "LSPRemoveWorkspaceFolder" , "RemoveWorkspaceFolder"   } ,
                l    = { "LSPListWorkspaceFolders"  , "ListWorkspaceFolders"    } ,
            },
            g    = {
                name =   "+GoTo"                    ,
                D    = { "LSPDeclaration"           , "Declaration"             } ,
                d    = { "LSPDefinition"            , "Definition"              } ,
                r    = { "LSPReferences"            , "References"              } ,
                i    = { "LSPImplementation"        , "Implementation"          } ,
                k    = { "LSPGotoPrev"              , "PrevDiagnostic"          } ,
                j    = { "LSPGotoNext"              , "NextDiagnostic"          } ,
            },
        },
        s = {
            name = "+Session"  ,
            c = { ":SClose"    , "CloseSession"  } ,
            d = { ":SDelete"   , "DeleteSession" } ,
            l = { ":SLoad"     , "LoadSession"   } ,
            s = { ":Startify"  , "StartPage"     } ,
            S = { ":SSave"     , "SaveSession"   } ,
        },
        a = {
            name = "+Actions"       ,
            c = { ":ColorizerToggle" , "Colorizer"             } ,
            h = { ":nohl"            , "NoHighlight"           } ,
            l = { ":Bracey"          , "BraceyStartLiveServer" } ,
            L = { ":BraceyStop"      , "BraceyStopLiveServer"  } ,
            v = { ":Codi"            , "CodiVirtualREPL"       } ,
            V = { ":Codi!"           , "CodiVirtualREPLOff"    } ,
        },
        ["<space>"] = {"<Plug>(easymotion-overwin-f2)", "EasyMotion"},
        ["<cr>"] = {" :so $MYVIMRC<CR>", "Source Config"},
        j = {"mao<Esc>`a", "NewLineBelow"},
        k = {"mao<Esc>`a", "NewLineAbove"},

    },
    {
        prefix = "<Leader>"
    })
