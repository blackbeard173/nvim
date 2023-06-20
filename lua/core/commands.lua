-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Format on Save
local fsave = vim.api.nvim_create_augroup('fsave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = fsave,
  command = 'Format',
})
