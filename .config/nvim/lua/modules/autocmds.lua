local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local command = vim.api.nvim_create_user_command -- Create user command

-- Automatically VimResized
autocmd({'VimResized'}, {pattern = '*', command = 'wincmd ='})

-- Make Vim open help in a vertical split
autocmd({'BufWinEnter'}, {
    group = augroup('NvimHelpVertical', {clear = true}),
    pattern = '*.txt',
    callback = function()
        if vim.bo.ft == 'help' then vim.cmd('wincmd L') end
    end
})

-- Remove trailing whilespace
autocmd({'BufWritePre'}, {pattern = '*', command = '%s/\\s\\+$//e'})

-- Terminal settings
autocmd({'TermOpen'}, {pattern = '*', command = 'startinsert'})

-- Preserve last editing position
autocmd({"BufReadPost"}, {
    pattern = {'*'},
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end
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
