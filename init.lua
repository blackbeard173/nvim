local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{"nyoom-engineering/oxocarbon.nvim"},
}
local opts = {
    ui = {
		border = "rounded",
	},
	checker = {
		enabled = true,
	},
}

vim.g.mapleader = " "

require("lazy").setup(plugins, opts)

vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"
