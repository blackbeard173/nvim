vim.opt.background = "dark"
-- vim.api.nvim_set_hl(0,"Normal",{bg="none"})
-- vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})

local status, colorscheme = pcall(vim.cmd, 'colorscheme oxocarbon')

if not status then
    return
end
