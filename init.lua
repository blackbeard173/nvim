vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins={
  {'folke/tokyonight.nvim'},
  {'nyoom-engineering/oxocarbon.nvim'},

}
local opts={
  ui={border="rounded",},
  checker={enabled=true,},
}
require("lazy").setup(plugins, opts)

vim.cmd.colorscheme("tokyonight-night")

-- keymaps
vim.keymap.set("n","<leader>l","<cmd>Lazy<cr>")
vim.keymap.set("n","<leader>,","<cmd>e $MYVIMRC<cr>")
vim.keymap.set("n","<leader>e",vim.cmd.Lexplore)
