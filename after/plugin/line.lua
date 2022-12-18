require('lualine').setup({
    options = {
        component_separators = '|',
        section_separators = '',
        globalstatus = false
    },
    sections = {
        lualine_x = { 'filetype' }
    }
})
