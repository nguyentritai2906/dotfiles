local function getWords()
  return tostring(vim.fn.wordcount().words)
end

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'edge',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {getWords, 'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { require'tabline'.tabline_buffers },
        lualine_x = { require'tabline'.tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {}
}
