return {
	{ 'echasnovski/mini.comment', event = { 'BufReadPost', 'BufNewFile' }, config = true },
	{ 'echasnovski/mini.completion', config = true, enabled = false },
	{ 'echasnovski/mini.indentscope', event = { 'BufReadPre' }, opts = { symbol = '│' } },
	{ 'echasnovski/mini.move', config = true },
	{ 'echasnovski/mini.pairs', config = true },
	{ 'echasnovski/mini.surround', config = true },
	{ 'echasnovski/mini.trailspace', config = true },
}
