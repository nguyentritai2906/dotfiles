-- The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
vim.g.barbaric_ime = 'fcitx'

-- The input method for Normal mode (as defined by `xkbswitch -g`, `ibus engine`, or `xkb-switch -p`)
vim.g.barbaric_default = 0

-- The scope where alternate input methods persist (buffer, window, tab, global)
vim.g.barbaric_scope = 'buffer'

-- Forget alternate input method after n seconds in Normal mode (disabled by default)
-- Useful if you only need IM persistence for short bursts of active work.
vim.g.barbaric_timeout = -1

 -- The fcitx-remote binary (to distinguish between fcitx and fcitx5)
vim.g.barbaric_fcitx_cmd = 'fcitx5-remote'

-- -- The xkb-switch library path (for Linux xkb-switch users ONLY)
-- vim.g.barbaric_libxkbswitch = $HOME . '/.local/lib/libxkbswitch.so'
