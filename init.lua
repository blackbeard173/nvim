require('configs.lazy')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.cmd.colorscheme('tokyonight-night')

-- keymaps
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>edit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>e', vim.cmd.Lexplore)
vim.keymap.set('n', '<Leader>t<Space>', [[<CMD>%s/\s\+$//e<CR>]], {}) -- Trim trailing whitespace
vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })

-- settings
local o = vim.o
o.termguicolors = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
