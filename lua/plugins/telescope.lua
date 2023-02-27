return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        -- branch = '0.1.x',
        config = function()
            require('telescope').setup({
                --[[ defaults = {
                    layout_config = {
                        vertical = { width = 0.5 }
                    },
                }, ]]
            })
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('file_browser')

            local builtin = require('telescope.builtin')

            local map = vim.keymap.set
            -- map('n', '<leader>tf', builtin.find_files, {})
            map('n', '<leader>tg', builtin.live_grep, {})
            map('n', '<leader>tb', builtin.buffers, {})
            map('n', '<leader>th', builtin.help_tags, {})
            map("n", "<leader>tf", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
    },
}
