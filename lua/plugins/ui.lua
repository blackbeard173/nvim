return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        lazy = true,
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
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
            local function fg(name)
                return function()
                    ---@type {foreground?:number}?
                    local hl = vim.api.nvim_get_hl_by_name(name, true)
                    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
                end
            end
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            "dashboard", "lazy", "alpha"
                        }
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_x = {
                        {
                            function() return require("noice").api.status.command.get() end,
                            cond = function()
                                return package.loaded["noice"] and
                                    require("noice").api.status.command.has()
                            end,
                            color = fg("Statement")
                        },
                        {
                            function() return require("noice").api.status.mode.get() end,
                            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                            color = fg("Constant"),
                        },
                        { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
                    },
                    lualine_y = {
                        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree" },
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
