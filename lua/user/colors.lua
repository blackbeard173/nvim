local ok, colors = pcall(vim.cmd, "colorscheme tokyonight")

if not ok then
    print("Error loading colorscheme")
end
