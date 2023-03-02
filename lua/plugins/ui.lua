return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        keys = {
            { "<leader>fe", "<cmd>NeoTreeFocusToggle<cr>", desc = "NeoTree" },
            { "<leader>e",  "<leader>fe",                  desc = "NeoTree", remap = true },

        },
        opts = {
            window = {
                position = "right",
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
                follow_current_file = true,
                group_empty_dirs = false,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = false,
            },
        },
        config = true,
    },
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        -- version = "v3.*",
        opts = {
            options = {
                always_show_bufferline = false,
            },
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        opts = function(plugin)
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            "lazy", "alpha"
                        }
                    },
                },
                -- extensions = { "neo-tree" },
            }
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
        keys = {
            { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                  mode = "c",                 desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end,                                    desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end,                                 desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end,                                     desc = "Noice All" },
            { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,   silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
            { "<c-b>",       function() if not require("noice.lsp").scroll( -4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
        },
    },
    { "MunifTanjim/nui.nvim",        lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
