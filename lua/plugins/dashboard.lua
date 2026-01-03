local icons = require("ui.icons")
local ascii = require("ui.ascii")

return {
    "goolord/alpha-nvim",
    config = function()
        local theme = require("alpha.themes.theta")
        local dash = require("alpha.themes.dashboard")

        -- Header Section
        local header = {
            type = "text",
            val = ascii.dragon,
            opts = {
                position = "center",
                hl = "type",
            },
        }

        -- Actions Section
        local actions = {
            type = "group",
            val = {
                { type = "text", val = "Quick Actions", opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                dash.button("n", icons.ui.NewFile .. " New File", "<cmd>ene<CR>"),
                dash.button("ff", icons.ui.FindFile .. " Find File"),
                dash.button("fs", icons.ui.FindText .. " Find String"),
                dash.button("r", icons.ui.History .. " Restore Session", "<cmd>AutoSession restore<CR>"),
                dash.button("u", icons.ui.Hourglass .. " Update Plugins", "<cmd>Lazy sync<CR>"),
                dash.button("q", icons.ui.Exit .. " Quit", "<cmd>qa<CR>"),
            },
            position = "center",
        }

        -- Footer Section
        local footer = {
            os.date("󱑎 %H:%M \t 󰃭 %a,%d %b "),
            icons.ui.Neovim
                .. " "
                .. vim.version().major
                .. "."
                .. vim.version().minor
                .. "-"
                .. vim.version().prerelease,
        }

        theme.config.layout[2] = header
        theme.config.layout[6] = actions

        require("alpha").setup(theme.config)
    end,
}
