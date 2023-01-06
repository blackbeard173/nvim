local builtin = require('telescope.builtin')

local map = vim.keymap.set
map("n", "<leader>tf", builtin.find_files, {})
map("n", "<leader>tg", builtin.live_grep, {})
map("n", "<leader>tb", builtin.buffers, {})
map("n", "<leader>th", builtin.help_tags, {})
