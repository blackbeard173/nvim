require('telescope').setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
