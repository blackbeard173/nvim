local map = vim.keymap.set

map('n', '<leader>e', '<cmd>Lexplore<cr>')
map('n', '<leader>l', '<cmd>Lazy<cr>')
map('n', '<leader>,', '<cmd>e $MYVIMRC<cr>')
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>tb", "<cmd>Telescope file_browser<cr>")
