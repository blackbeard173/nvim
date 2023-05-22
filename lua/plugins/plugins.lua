return {
	-- ui
	{ 'folke/tokyonight.nvim' },
	{ 'nyoom-engineering/oxocarbon.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },

	--
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = 'Telescope',
		keys = {
			{ '<leader>p', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = { auto_install = true, highlight = { enable = true }, indent = { enable = true } },
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},

	-- mini plugins
	{
		'echasnovski/mini.statusline',
		--         config = function(_, opts)
		--             require('mini.statusline').setup(opts)
		--         end,
		config = true,
	},
	{
		'echasnovski/mini.comment',
		-- keys = { 'gc', 'gcc' },
		--         config = function(_, opts)
		--             require('mini.comment').setup(opts)
		--         end,
		config = true,
	},
	{
		'echasnovski/mini.indentscope',
		opts = { symbol = '│' },
		-- config = function(_, opts)
		-- 	require('mini.indentscope').setup(opts)
		-- end,
	},
	{
		'echasnovski/mini.pairs',
		--         config = function(_, opts)
		--             require('mini.pairs').setup(opts)
		--         end,
		config = true,
	},
	{
		'echasnovski/mini.basics',
		opts = {
			basic = true,
			extra_ui = true,
			win_borders = 'rounded',
		},
		-- config = function(_, opts)
		-- 	require('mini.basics').setup(opts)
		-- end,
	},
	{ 'echasnovski/mini.surround', config = true },
	{ 'Exafunction/codeium.vim' },
	{
		'stevearc/oil.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = true,
	},
}
