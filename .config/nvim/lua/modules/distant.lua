require('distant').setup {
    -- Applies Chip's personal settings to every machine you connect to
    --
    -- 1. Ensures that distant servers terminate with no connections
    -- 2. Provides navigation bindings for remote directories
    -- 3. Provides keybinding to jump into a remote file's parent directory
    ['*'] = require('distant.settings').chip_default(),
    ['pc0'] = {mode = 'ssh', ssh = {port = 10022, user = 'nttai'}},
    ['pc1'] = {mode = 'ssh', ssh = {port = 11022, user = 'nttai'}},
    ['pc0vpn'] = {mode = 'ssh', ssh = {port = 22, user = 'nttai'}},
    ['pc1vpn'] = {mode = 'ssh', ssh = {port = 22, user = 'nttai'}},
    ['staging'] = {mode = 'ssh', ssh = {port = 22, user = 'administrator'}}
}
