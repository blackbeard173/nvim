local map = vim.keymap.set

map('n', '<leader>e', '<cmd>Lexplore<cr>', { desc = 'File Explorer' })
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
map('n', '<leader>,', '<cmd>e $MYVIMRC<cr>', { desc = 'Config' })
map("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format' })
