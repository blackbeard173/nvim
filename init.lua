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

local plugins = {
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			auto_install = true,
			highlight = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		},
		config = function(_, opts)
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"echasnovski/mini.trailspace",
		-- :lua MiniTrailspace.trim()
		-- :lua MiniTrailspace.trim_last_lines()
		config = function(_, opts)
			require("mini.trailspace").setup(opts)
		end,
	},
	{
		"echasnovski/mini.statusline",
		config = function(_, opts)
			require("mini.statusline").setup(opts)
		end,
	},
	{
		"echasnovski/mini.move",
		config = function(_, opts)
			require("mini.move").setup(opts)
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<c-t>]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
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

require("options")
require("keymaps")

vim.cmd.colorscheme("tokyonight")
