return {
	-- ui
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'folke/noice.nvim',
		-- event = 'VeryLazy',
		opts = {
			lsp = {
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
	},

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
