local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    print("Error in treesitter config")
    return
end

treesitter.setup {
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
