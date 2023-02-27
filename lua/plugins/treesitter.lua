return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

            if not treesitter_status_ok then
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
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            local context_status_ok, tscontext = pcall(require, "treesitter-context")
            if context_status_ok then
                tscontext.setup({})
            end
        end
    },
}
