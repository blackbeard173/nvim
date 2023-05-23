vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>edit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>e', vim.cmd.Lexplore)
vim.keymap.set('n', '<Leader>t<Space>', [[<CMD>%s/\s\+$//e<CR>]], {}) -- Trim trailing whitespace
