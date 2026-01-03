return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            chunk = {
                enable = true,
                use_treesitter = true,
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "┌",
                    left_bottom = "└",
                    right_arrow = "─",
                },
                error_sign = true,
                style = {
                    { fg = "#383838" },
                    { fg = "#FF5454" },
                },
                delay = 0,
            },
        },
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>x",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics",
            },
        },
    },
}
