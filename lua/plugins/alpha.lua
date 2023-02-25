-- Help: https://github.com/NvChad/NvChad/blob/main/lua/plugins/configs/alpha.lua

return {
    {

        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local present, alpha = pcall(require, "alpha")

            if not present then
                print("Error in alpha config")
                return
            end

            -- dynamic header padding
            local fn = vim.fn
            local marginTopPercent = 0.2
            local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

            -- display the number of plugins
            local plugin_count = fn.len(fn.globpath("~/.local/share/nvim/lazy/", "*", 0, 1))

            local options = {
                headerPaddingTop = { type = "padding", val = headerPadding },
                header = {
                    type = "text",
                    val = {
                        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
                    },
                    opts = {
                        position = "center",
                    },
                },
                headerPaddingBottom = { type = "padding", val = 2 },
                plugins = {
                    type = "text",
                    val = "Loaded " .. plugin_count .. " plugins.",
                    opts = {
                        position = "center",
                    },
                }
            }
            alpha.setup {
                layout = {
                    options.headerPaddingTop,
                    options.header,
                    options.headerPaddingBottom,
                    options.plugins,
                },
                opts = {},
            }
        end
    }
}
