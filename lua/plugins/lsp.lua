return {
	{ 'neovim/nvim-lspconfig' },
	{
		'williamboman/mason.nvim',
		opts = {
			ui = {
				border = 'rounded',
				icons = { package_installed = '✓', package_pending = '➜', package_uninstalled = '✗' },
			},
		},
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = { ensure_installed = { 'lua_ls', 'tsserver' } },
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)

			local on_attach = function()
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format({ async = true })
				end)
			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					require('lspconfig')[server_name].setup({ on_attach = on_attach, capabilities = capabilities })
				end,

				['lua_ls'] = function() -- handler override for `lua_ls`:
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {
								runtime = { version = 'LuaJIT' },
								diagnostics = { globals = { 'vim' } },
								telemetry = { enable = false },
							},
						},
					})
				end,
			})
		end,
	},
}
