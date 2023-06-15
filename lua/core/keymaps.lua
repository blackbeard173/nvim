vim.g.mapleader = ' '

local map = vim.keymap.set
map('n', '<leader>,', '<cmd>edit $MYVIMRC<cr>')
map('n', '<leader><space>', '<cmd>buffers<cr>:buffer<Space>')
map('n', '<leader>bl', '<cmd>buffer #<cr>')
map('n', '<leader>e', '<cmd>Lexplore!<cr>')
map('n', '<leader>l', '<cmd>Lazy<cr>')