return {
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
    },
    -- {
    --   "jcdickinson/codeium.nvim",
    --   dependencies = {
    --     "hrsh7th/nvim-cmp",
    --   },
    --   config = function()
    --     require("codeium").setup({
    --     })
    --   end
    -- },

    -- dependencies for other plugins
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
}
