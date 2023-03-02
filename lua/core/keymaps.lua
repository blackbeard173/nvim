local map = vim.keymap.set

map('n', '<leader>e', '<cmd>:Lexplore<cr>', { desc = 'File Explorer' })
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })
map('n', '<leader>,', '<cmd>e $MYVIMRC<cr>', { desc = 'Config' })
map("n", "<leader>ff", vim.lsp.buf.format, { desc = 'Format' })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
