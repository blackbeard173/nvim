require('lualine').setup({
    options = {
        theme = 'tundra',
        component_separators = '|',
        section_separators = '',
        globalstatus = false,
    },
    sections = {
        lualine_x = { 'filetype' },
    },
})
