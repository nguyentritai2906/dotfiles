local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")
require('luasnip.loaders.from_snipmate').lazy_load()

local function on_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    buf_set_keymap('n', '<space>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>lgk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>lgj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>lE', '<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>', opts)
    buf_set_keymap('n', '<space>le', '<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', opts)

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd([[
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
    ]])
    end

    -- Only EMF has format capabilities
    if client.name ~= 'efm' then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end

    if client.name == 'pyright' then client.server_capabilities.signatureHelpProvider = false end

    if client.name == 'ruff_lsp' then
        -- client.server_capabilities.renameProvider = false
        client.server_capabilities.hoverProvider = false
    end

    if client.name == 'pylsp' then
        client.server_capabilities.renameProvider = false
        client.server_capabilities.hoverProvider = false
    end

    -- Somehow really slow
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    end

    require"lsp_signature".on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LSP Zero
lsp.preset('recommended')

-- Cmp setup
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    preselect = 'None',
    completion = {completeopt = 'menu,menuone,noinsert,noselect,preview'},
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    sources = {
        {name = 'luasnip', keyword_length = 1}, {name = 'nvim_lsp', keyword_length = 1},
        {name = 'path', keyword_length = 1, max_item_count = 3},
        {name = 'buffer', keyword_length = 1, max_item_count = 3}
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Insert, select = false},
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.jump(1)
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort()
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        })
  }
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {error = '', warn = '', hint = '', info = ''}
})

-- Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.on_attach = on_attach
lsp.setup()

vim.diagnostic.config({virtual_text = true})

-- Setup mason so it can manage external tooling
require('mason').setup()
local servers = {
    bashls = {},
    cssls = {},
    dockerls = {},
    efm = {},
    eslint = {},
    gopls = {},
    html = {},
    jsonls = {},
    pyright = {
        settings = {
            disableOrganizeImports = true,
            flags = {debounce_text_changes = 300},
            python = {
                analysis = {
                    -- ignore = {"*"},
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "basic",
                    autoImportCompletion = true,
                    useLibraryCodeForTypes = true,
                    -- diagnosticSeverityOverrides = {
                    --     reportGeneralTypeIssues = "none",
                    --     reportOptionalMemberAccess = "none",
                    --     reportOptionalSubscript = "none",
                    --     reportPrivateImportUsage = "none"
                    -- }
                },
                linting = {pylintEnabled = false},
            }
        }
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    flake8 = {enabled = false},
                    jedi_completion = {enabled = false},
                    jedi_definition = {enabled = false},
                    yapf = {enabled = false},  -- really slow
                    rope_completion = {enabled = false},
                    pylint = {enabled = false},
                    pydocstyle = {enabled = false},
                    preload = {enabled = false},
                    mccabe = {enabled = false},
                    jedi_symbols = {enabled = false},
                    jedi_references = {enabled = false},
                    pyflakes = {enabled = false},
                    pycodestyle = {enabled = false}
                }
            }
        }
    },
    tailwindcss = {},
    ts_ls = {},
    vimls = {},
    yamlls = {},
    lua_ls = {
        Lua = {workspace = {checkThirdParty = false}, telemetry = {enable = false}, diagnostics = {globals = {'vim'}}}
    },
    omnisharp = {
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            ["textDocument/references"] = require('omnisharp_extended').references_handler,
            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
        },
    },
    kotlin_language_server = {},
}
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {ensure_installed = vim.tbl_keys(servers)}
mason_lspconfig.setup_handlers {
    function(server_name)
        -- check if the server has a custom setup
        -- if has settings or handlers then use them
        -- else {} is used to avoid nil
        if servers[server_name] == nil then
            servers[server_name] = {
                settings = {},
                handlers = {}
            }
        else
            if servers[server_name].settings == nil then servers[server_name].settings = {} end
            if servers[server_name].handlers == nil then servers[server_name].handlers = {} end
        end
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name].settings,
            handlers = servers[server_name].handlers
        }
    end
}

-- efm-langserver
local flake8 = {
    LintCommand = "flake8 --config ~/.config/flake8/flake8 --max-line-length 120 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    formatStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true} -- really slow
local autopep8 = {formatCommand = "autopep8 -", formatStdin = true}
local autoflake = {
    formatCommand = "autoflake --in-place --remove-unused-variables --remove-all-unused-imports -",
    formatStdin = true
}
local black = {formatCommand = "black --quiet -", formatStdin = true}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
local prettier_yaml = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
local eslint = {
    lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules..bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
local rustfmt = {formatCommand = "rustfmt", formatStdin = true}
local root_markers = {".zshrc", ".git/"}
local ruff = {formatCommand = "ruff format --stdin-filename ${INPUT}", formatStdin = true}
local clang_format = {formatCommand = "clang-format", formatStdin = true}
local jq = {formatCommand = "jq .", formatStdin = true}

require"lspconfig".efm.setup {
    on_attach = on_attach,
    root_dir = require"lspconfig".util.root_pattern(unpack(root_markers)),
    init_options = {
        documentFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "rust", "go"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            -- python = {autoflake, isort, flake8, black, ruff},
            python = {autoflake, isort, ruff},
            javascriptreact = {prettier, eslint},
            javascript = {prettier, eslint},
            sh = {shfmt, shellcheck},
            html = {prettier},
            css = {prettier},
            json = {prettier, jq},
            yaml = {prettier_yaml},
            rust = {rustfmt},
            go = {},
        }
    }
}

lsp.format_on_save({
    format_opts = {async = false, timeout_ms = 10000},
    servers = {
        ['lua_ls'] = {'lua'},
        ['rust_analyzer'] = {'rust'},
        ['efm'] = {'python', 'javascript', 'javascriptreact', 'sh', 'html', 'css', 'json', 'yaml', 'rust', 'go'},
    }
})
