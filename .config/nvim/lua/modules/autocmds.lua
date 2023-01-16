local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local command = vim.api.nvim_create_user_command -- Create user command

-- Automatically VimResized
autocmd({'VimResized'}, {pattern = '*', command = 'wincmd ='})

-- Make Vim open help in a vertical split
local vert_help = augroup('NvimHelpVertical', {clear = true})
autocmd({'BufEnter'}, {
    pattern = '*.txt',
    command = 'if &buftype == "help" | wincmd L | set number relativenumber | endif',
    group = vert_help
})

-- Remove trailing whilespace
autocmd({'BufWritePre'}, {pattern = '*', command = '%s/\\s\\+$//e'})

-- Terminal settings
autocmd({'TermOpen'}, {pattern = '*', command = 'startinsert'})

-- Preserve last editing position
autocmd({ "BufReadPost" }, {
    pattern = { '*' },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*'
})

-- Write with no autocmds
command("W", 'noa w', {})

-- Better alternative for autochdir
-- autocmd BufEnter * silent! lcd %:p:h
function _G.ChangeDirCurBuf()
    vim.cmd('lcd %:p:h')
    vim.cmd('pwd')
end

vim.keymap.set('n', '<Leader>lcd', ':call ChangeDirCurBuf()<CR>', {silent = true})
