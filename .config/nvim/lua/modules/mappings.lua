-- Map leader to space
vim.g.mapleader = ' '

-- Clear all highlight
vim.keymap.set('n', '<leader>ah', ':noh<CR>')

-- Keep visual selection when indenting/outdenting/commemt/uncomment
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Insert blank line
vim.keymap.set('n', '<leader>j', 'mao<Esc>`a')
vim.keymap.set('n', '<leader>k', 'maO<Esc>`a')

-- Delete next word after cursor (similar to CTRL-W) in insert mode
vim.keymap.set('i', '<C-e>', '<C-o>de')

-- Tabs navigation
vim.keymap.set('n', '<leader>th', 'gT')
vim.keymap.set('n', '<leader>tl', 'gt')
vim.keymap.set('n', '<leader>tH', ':tabfirst<CR>')
vim.keymap.set('n', '<leader>tL', ':tablast<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<leader>to', ':tabonly<CR>')
vim.keymap.set('n', '<leader>tn', ':TablineTabNew<CR>')
vim.keymap.set('n', '<leader>tr', ':TablineTabRename<CR>')
vim.keymap.set('n', '<leader>tj', ':-tabmove<CR>')
vim.keymap.set('n', '<leader>tk', ':+tabmove<CR>')

-- Buffers navigation
vim.keymap.set('n', '¬', ':TablineBufferNext<CR>')
vim.keymap.set('n', '˙', ':TablineBufferPrevious<CR>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Reload config
vim.keymap.set('n', '<leader><CR>', ':luafile $MYVIMRC<CR>')

-- Keeping it inplace
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

-- -- Undo break points
-- vim.keymap.set('i', '<Space>', '<Space><C-G>u')

-- -- Jumplist mutations
-- vim.keymap.set('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', {expr = true})
-- vim.keymap.set('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', {expr = true})

-- Execute last ExCommand
vim.keymap.set('v', '<leader>;', ':normal @:<CR>')

-- Search
-- Center search hit and automatically clear highlight with is.vim
vim.keymap.set("n", "n", "nzzzv", {noremap = true, silent = true})
vim.keymap.set("n", "N", "Nzzzv", {noremap = true, silent = true})

vim.keymap.set('n', '<C-d>', '<C-d>zz', {silent = true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {silent = true})

vim.keymap.set('x', 'p', '"_dP', {silent = true})

vim.keymap.set('i', '<C-d>', '<C-d><C-o>zz', {silent = true})
vim.keymap.set('i', '<C-u>', '<C-u><C-o>zz', {silent = true})
vim.keymap.set('i', '<C-c>', '<Esc>', {silent = true})

vim.keymap.set('n', 'q:', '<Esc>:', {silent = true})
vim.keymap.set('v', 'q:', '<Esc>:', {silent = true})

vim.keymap.set('n', '<leader>s', ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>", {silent = true})

-- Better alternative for autochdir
-- autocmd BufEnter * silent! lcd %:p:h
function ChangeDirCurBuf()
    vim.cmd('lcd %:p:h')
    vim.cmd('pwd')
end

vim.api.nvim_set_keymap('n', '<leader>lcd', ':lua ChangeDirCurBuf()<CR>', {noremap = true, silent = true})
