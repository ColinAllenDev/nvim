return {
    -- Treesitter Parsers
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
        "windwp/nvim-ts-autotag",
    },
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "bash",
            "regex",
            "c",
            "rust",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
