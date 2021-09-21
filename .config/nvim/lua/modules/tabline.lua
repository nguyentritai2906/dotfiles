local tabline = require('tabline')

function tabline.tab_nnew(...)
    local args = {...}

    if #args > 1 then
        tabline.tab_rename(args[1])
        for i, name in pairs({unpack(args, 2)}) do
            tabline.tab_new()
            tabline.tab_rename(name)
        end
        vim.cmd([[redrawtabline]])
    else
        tabline.tab_new()
        tabline.tab_rename(args[1])
    end

end

vim.cmd([[
    command! -nargs=* TablineTabNNew :lua require'tabline'.tab_nnew(<f-args>)
    ]])

tabline.setup {enable = false}
