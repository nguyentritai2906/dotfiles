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

-- Normal mappings with Prefix
wk.register({
    i = {
        name = "+Ipython",
        s    = "Start",
        r    = "RunAll",
        t    = "RunAndTimeExec",
        c    = "ExecCell",
        C    = "ExecCellGoNext",
        l    = "ClearScreen",
        x    = "CloseFigure",
        h    = "ExecCurrentLine",
        R    = "Restart",
        j    = "NextCell",
        k    = "PrevCell",
    },
    c = {
        name = "+Commenter",
        c    = "CommentLine",
        i    = "InvertComment",
        u    = "UncommentLine",
    },
    g = {
        name = "+GitGutter",
        k    = "PrevHunk",
        j    = "NextHunk",
        p    = "PreviewHunk",
        s    = "StageHunk",
        u    = "UndoHunk",
    },
    w = {
        name = "+Vimwiki",
        i    = "DiaryIndex",
        s    = "UISelect",
        t    = "TabIndex",
        w    = "Index",
        d    = "DeleteFile",
        h    = "ToHTML",
        hh   = "HTMLBrowse",
        n    = "Goto",
        r    = "RenameFile",
        ["<space>"]    = {
            name = "+Diary",
            i    = "GenerateLinks",
            t    = "TabMakeNote",
            w    = "MakeNote",
            y    = "MakeYesterdayDiaryNote",
            m    = "MakeTomorrowDiaryNote",
        } ,
    },
    f = {
        name  = "+Find",
        ['/'] = "BLines",
        ['?'] = "Lines",
        f     = "Files",
        b     = "Buffers",
        c     = "Commands",
        h     = "Helptags",
        g     = "GFiles",
        m     = "Maps",
        r     = "Recent",
        [":"] = "CHistory",
        s     = "Snippets",
        t     = "HFiles",
        p     = "PFiles",
        ["`"] = "Marks",
        ["."] = "Ag",
    },
    l = {
        name = "+LSP",
        k    = "SignatureHelp",
        d    = "TypeDefinition",
        e    = "ShowLineDiagnostics",
        E    = "ToggleDiagnostic",
        q    = "ListDiagnosticsLocation",
        r    = "Rename",
        f    = "Formatting",
        v    = "VirtualText",
        w    = {
            name = "+Workspace",
            a    = "AddWorkspaceFolder",
            r    = "RemoveWorkspaceFolder",
            l    = "ListWorkspaceFolders",
        },
        g    = {
            name = "+GoTo",
            D    = "Declaration",
            d    = "Definition",
            r    = "References",
            i    = "Implementation",
            k    = "PrevDiagnostic",
            j    = "NextDiagnostic",
        },
        p    = {
            name = "+Preview",
            d    = "Definition",
            r    = "References",
            i    = "Implementation",
            c    = "CloseAllPreview",
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
    ["<space>"] = "Easy Motion",
    ["<cr>"] = "Source Config",
    j = "Newline Below",
    k = "Newline Above",
    E = "Resize",
    t = {
        name = "+Tab",
        h = "TabLeft",
        l = "TabRight",
        H = "TabFirst",
        L = "TabLast",
        j = "TabMoveLeft",
        k = "TabMoveRight",
        c = "TabClose",
        n = "TabNew",
        r = "TabRename",
    },
    d = {
        name = "+DAP",
        b = "Breakpoint",
        B = "ConditionalBreakpoint",
        E = "ExceptionBreakpoint",
        h = "StepOut",
        l = "StepInto",
        j = "StepBack",
        k = "StepOver",
        d = "Continue",
        c = "ClearAllBreakpoints",
        C = "RunToCursor",
        q = "Quit",
        K = "Up",
        J = "Down",
        e = "Evaluate",
        u = "ToggleUI",
        i = {
            name = "+Info",
            i = "Interactive",
            b = "Breakpoint",
            r = "REPL",
            s = "Scope",
            t = "Stack",
            w = "Watch",
        },
    },
},
{
    prefix = "<Leader>"
})

-- Normal mappings without Prefix
wk.register({
        c = {
            r = {
                name = "+AbolisCoercion",
                s = "snake_case",
                m = "MixedCase",
                c = "camelCase",
                u = "UPPER_CASE",
                t = "Title Case",
                ["-"] = "dash-case",
                ["."] = "dot.case",
                ["<space>"] = "space case",
            }
        },
        g = {
            s = {
                name = "+TSScope",
                n = "Init",
                i = "Incremental",
                d = "Decremental",
            }
        }
})

-- Visual mappings with Prefix
wk.register({
    i = {
    name = "+Ipython",
    h    = "ExecCurrentSelection",
    }
},
{
    prefix = "<Leader>",
    mode = "v"
})
